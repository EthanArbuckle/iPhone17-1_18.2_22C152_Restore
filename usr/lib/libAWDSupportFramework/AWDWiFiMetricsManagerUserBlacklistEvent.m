@interface AWDWiFiMetricsManagerUserBlacklistEvent
- (BOOL)hasApuuid;
- (BOOL)hasBlacklistDuration;
- (BOOL)hasDstChange;
- (BOOL)hasEventType;
- (BOOL)hasLocState;
- (BOOL)hasMoState;
- (BOOL)hasSecurityType;
- (BOOL)hasSsid;
- (BOOL)hasTimestamp;
- (BOOL)hasTrigger;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)apuuid;
- (NSString)ssid;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)blacklistDuration;
- (unint64_t)dstChange;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unint64_t)trigger;
- (unsigned)eventType;
- (unsigned)locState;
- (unsigned)moState;
- (unsigned)securityType;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setApuuid:(id)a3;
- (void)setBlacklistDuration:(unint64_t)a3;
- (void)setDstChange:(unint64_t)a3;
- (void)setEventType:(unsigned int)a3;
- (void)setHasBlacklistDuration:(BOOL)a3;
- (void)setHasDstChange:(BOOL)a3;
- (void)setHasEventType:(BOOL)a3;
- (void)setHasLocState:(BOOL)a3;
- (void)setHasMoState:(BOOL)a3;
- (void)setHasSecurityType:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasTrigger:(BOOL)a3;
- (void)setLocState:(unsigned int)a3;
- (void)setMoState:(unsigned int)a3;
- (void)setSecurityType:(unsigned int)a3;
- (void)setSsid:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setTrigger:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDWiFiMetricsManagerUserBlacklistEvent

- (void)dealloc
{
  [(AWDWiFiMetricsManagerUserBlacklistEvent *)self setSsid:0];
  [(AWDWiFiMetricsManagerUserBlacklistEvent *)self setApuuid:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsManagerUserBlacklistEvent;
  [(AWDWiFiMetricsManagerUserBlacklistEvent *)&v3 dealloc];
}

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

- (void)setEventType:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_eventType = a3;
}

- (void)setHasEventType:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasEventType
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (BOOL)hasSsid
{
  return self->_ssid != 0;
}

- (void)setSecurityType:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x80u;
  self->_securityType = a3;
}

- (void)setHasSecurityType:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = v3 & 0x80 | *(unsigned char *)&self->_has & 0x7F;
}

- (BOOL)hasSecurityType
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setTrigger:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_trigger = a3;
}

- (void)setHasTrigger:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasTrigger
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setBlacklistDuration:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_blacklistDuration = a3;
}

- (void)setHasBlacklistDuration:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasBlacklistDuration
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasApuuid
{
  return self->_apuuid != 0;
}

- (void)setDstChange:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_dstChange = a3;
}

- (void)setHasDstChange:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDstChange
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setMoState:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_moState = a3;
}

- (void)setHasMoState:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasMoState
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setLocState:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_locState = a3;
}

- (void)setHasLocState:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasLocState
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsManagerUserBlacklistEvent;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWiFiMetricsManagerUserBlacklistEvent description](&v3, sel_description), -[AWDWiFiMetricsManagerUserBlacklistEvent dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    char has = (char)self->_has;
  }
  if ((has & 0x10) != 0) {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_eventType] forKey:@"eventType"];
  }
  ssid = self->_ssid;
  if (ssid) {
    [v3 setObject:ssid forKey:@"ssid"];
  }
  $D65DA98B74D0B4CD8187A7085A798D60 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x80000000) == 0)
  {
    if ((*(unsigned char *)&v6 & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_securityType] forKey:@"securityType"];
  *(unsigned char *)&$D65DA98B74D0B4CD8187A7085A798D60 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 8) != 0)
  {
LABEL_9:
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_trigger] forKey:@"trigger"];
    *(unsigned char *)&$D65DA98B74D0B4CD8187A7085A798D60 v6 = self->_has;
  }
LABEL_10:
  if (*(unsigned char *)&v6) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_blacklistDuration] forKey:@"blacklistDuration"];
  }
  apuuid = self->_apuuid;
  if (apuuid) {
    [v3 setObject:apuuid forKey:@"apuuid"];
  }
  char v8 = (char)self->_has;
  if ((v8 & 2) == 0)
  {
    if ((*(unsigned char *)&self->_has & 0x40) == 0) {
      goto LABEL_16;
    }
LABEL_20:
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_moState] forKey:@"moState"];
    if ((*(unsigned char *)&self->_has & 0x20) == 0) {
      return v3;
    }
    goto LABEL_17;
  }
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_dstChange] forKey:@"dstChange"];
  char v8 = (char)self->_has;
  if ((v8 & 0x40) != 0) {
    goto LABEL_20;
  }
LABEL_16:
  if ((v8 & 0x20) != 0) {
LABEL_17:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_locState] forKey:@"locState"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiMetricsManagerUserBlacklistEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
  }
  if ((has & 0x10) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_ssid) {
    PBDataWriterWriteStringField();
  }
  $D65DA98B74D0B4CD8187A7085A798D60 v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x80000000) == 0)
  {
    if ((*(unsigned char *)&v5 & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  PBDataWriterWriteUint32Field();
  *(unsigned char *)&$D65DA98B74D0B4CD8187A7085A798D60 v5 = self->_has;
  if ((*(unsigned char *)&v5 & 8) != 0)
  {
LABEL_9:
    PBDataWriterWriteUint64Field();
    *(unsigned char *)&$D65DA98B74D0B4CD8187A7085A798D60 v5 = self->_has;
  }
LABEL_10:
  if (*(unsigned char *)&v5) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_apuuid) {
    PBDataWriterWriteStringField();
  }
  char v6 = (char)self->_has;
  if ((v6 & 2) == 0)
  {
    if ((*(unsigned char *)&self->_has & 0x40) == 0) {
      goto LABEL_16;
    }
LABEL_19:
    PBDataWriterWriteUint32Field();
    if ((*(unsigned char *)&self->_has & 0x20) == 0) {
      return;
    }
    goto LABEL_20;
  }
  PBDataWriterWriteUint64Field();
  char v6 = (char)self->_has;
  if ((v6 & 0x40) != 0) {
    goto LABEL_19;
  }
LABEL_16:
  if ((v6 & 0x20) == 0) {
    return;
  }
LABEL_20:

  PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((void *)a3 + 3) = self->_timestamp;
    *((unsigned char *)a3 + 72) |= 4u;
    char has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    *((_DWORD *)a3 + 12) = self->_eventType;
    *((unsigned char *)a3 + 72) |= 0x10u;
  }
  if (self->_ssid) {
    [a3 setSsid:];
  }
  $D65DA98B74D0B4CD8187A7085A798D60 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x80000000) == 0)
  {
    if ((*(unsigned char *)&v6 & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  *((_DWORD *)a3 + 15) = self->_securityType;
  *((unsigned char *)a3 + 72) |= 0x80u;
  *(unsigned char *)&$D65DA98B74D0B4CD8187A7085A798D60 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 8) != 0)
  {
LABEL_9:
    *((void *)a3 + 4) = self->_trigger;
    *((unsigned char *)a3 + 72) |= 8u;
    *(unsigned char *)&$D65DA98B74D0B4CD8187A7085A798D60 v6 = self->_has;
  }
LABEL_10:
  if (*(unsigned char *)&v6)
  {
    *((void *)a3 + 1) = self->_blacklistDuration;
    *((unsigned char *)a3 + 72) |= 1u;
  }
  if (self->_apuuid) {
    [a3 setApuuid:];
  }
  char v7 = (char)self->_has;
  if ((v7 & 2) != 0)
  {
    *((void *)a3 + 2) = self->_dstChange;
    *((unsigned char *)a3 + 72) |= 2u;
    char v7 = (char)self->_has;
    if ((v7 & 0x40) == 0)
    {
LABEL_16:
      if ((v7 & 0x20) == 0) {
        return;
      }
      goto LABEL_17;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x40) == 0)
  {
    goto LABEL_16;
  }
  *((_DWORD *)a3 + 14) = self->_moState;
  *((unsigned char *)a3 + 72) |= 0x40u;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_17:
    *((_DWORD *)a3 + 13) = self->_locState;
    *((unsigned char *)a3 + 72) |= 0x20u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [(id)[(id)[(id)objc_opt_class() allocWithZone:a3] init];
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(void *)(v5 + 24) = self->_timestamp;
    *(unsigned char *)(v5 + 72) |= 4u;
    char has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 48) = self->_eventType;
    *(unsigned char *)(v5 + 72) |= 0x10u;
  }

  *(void *)(v6 + 64) = [(NSString *)self->_ssid copyWithZone:a3];
  $D65DA98B74D0B4CD8187A7085A798D60 v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x80000000) == 0)
  {
    if ((*(unsigned char *)&v8 & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  *(_DWORD *)(v6 + 60) = self->_securityType;
  *(unsigned char *)(v6 + 72) |= 0x80u;
  *(unsigned char *)&$D65DA98B74D0B4CD8187A7085A798D60 v8 = self->_has;
  if ((*(unsigned char *)&v8 & 8) != 0)
  {
LABEL_7:
    *(void *)(v6 + 32) = self->_trigger;
    *(unsigned char *)(v6 + 72) |= 8u;
    *(unsigned char *)&$D65DA98B74D0B4CD8187A7085A798D60 v8 = self->_has;
  }
LABEL_8:
  if (*(unsigned char *)&v8)
  {
    *(void *)(v6 + 8) = self->_blacklistDuration;
    *(unsigned char *)(v6 + 72) |= 1u;
  }

  *(void *)(v6 + 40) = [(NSString *)self->_apuuid copyWithZone:a3];
  char v9 = (char)self->_has;
  if ((v9 & 2) == 0)
  {
    if ((*(unsigned char *)&self->_has & 0x40) == 0) {
      goto LABEL_12;
    }
LABEL_16:
    *(_DWORD *)(v6 + 56) = self->_moState;
    *(unsigned char *)(v6 + 72) |= 0x40u;
    if ((*(unsigned char *)&self->_has & 0x20) == 0) {
      return (id)v6;
    }
    goto LABEL_13;
  }
  *(void *)(v6 + 16) = self->_dstChange;
  *(unsigned char *)(v6 + 72) |= 2u;
  char v9 = (char)self->_has;
  if ((v9 & 0x40) != 0) {
    goto LABEL_16;
  }
LABEL_12:
  if ((v9 & 0x20) != 0)
  {
LABEL_13:
    *(_DWORD *)(v6 + 52) = self->_locState;
    *(unsigned char *)(v6 + 72) |= 0x20u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    char has = (char)self->_has;
    if ((has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 72) & 4) == 0 || self->_timestamp != *((void *)a3 + 3)) {
        goto LABEL_47;
      }
    }
    else if ((*((unsigned char *)a3 + 72) & 4) != 0)
    {
      goto LABEL_47;
    }
    if ((*(unsigned char *)&self->_has & 0x10) != 0)
    {
      if ((*((unsigned char *)a3 + 72) & 0x10) == 0 || self->_eventType != *((_DWORD *)a3 + 12)) {
        goto LABEL_47;
      }
    }
    else if ((*((unsigned char *)a3 + 72) & 0x10) != 0)
    {
      goto LABEL_47;
    }
    ssid = self->_ssid;
    if ((unint64_t)ssid | *((void *)a3 + 8))
    {
      int v5 = -[NSString isEqual:](ssid, "isEqual:");
      if (!v5) {
        return v5;
      }
      char has = (char)self->_has;
    }
    if (has < 0)
    {
      if ((*((unsigned char *)a3 + 72) & 0x80) == 0 || self->_securityType != *((_DWORD *)a3 + 15)) {
        goto LABEL_47;
      }
    }
    else if ((*((unsigned char *)a3 + 72) & 0x80) != 0)
    {
LABEL_47:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((has & 8) != 0)
    {
      if ((*((unsigned char *)a3 + 72) & 8) == 0 || self->_trigger != *((void *)a3 + 4)) {
        goto LABEL_47;
      }
    }
    else if ((*((unsigned char *)a3 + 72) & 8) != 0)
    {
      goto LABEL_47;
    }
    if (has)
    {
      if ((*((unsigned char *)a3 + 72) & 1) == 0 || self->_blacklistDuration != *((void *)a3 + 1)) {
        goto LABEL_47;
      }
    }
    else if (*((unsigned char *)a3 + 72))
    {
      goto LABEL_47;
    }
    apuuid = self->_apuuid;
    if ((unint64_t)apuuid | *((void *)a3 + 5))
    {
      int v5 = -[NSString isEqual:](apuuid, "isEqual:");
      if (!v5) {
        return v5;
      }
      char has = (char)self->_has;
    }
    if ((has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 72) & 2) == 0 || self->_dstChange != *((void *)a3 + 2)) {
        goto LABEL_47;
      }
    }
    else if ((*((unsigned char *)a3 + 72) & 2) != 0)
    {
      goto LABEL_47;
    }
    if ((has & 0x40) != 0)
    {
      if ((*((unsigned char *)a3 + 72) & 0x40) == 0 || self->_moState != *((_DWORD *)a3 + 14)) {
        goto LABEL_47;
      }
    }
    else if ((*((unsigned char *)a3 + 72) & 0x40) != 0)
    {
      goto LABEL_47;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 72) & 0x20) == 0;
    if ((has & 0x20) != 0)
    {
      if ((*((unsigned char *)a3 + 72) & 0x20) == 0 || self->_locState != *((_DWORD *)a3 + 13)) {
        goto LABEL_47;
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
      uint64_t v4 = 2654435761 * self->_eventType;
      goto LABEL_6;
    }
  }
  uint64_t v4 = 0;
LABEL_6:
  NSUInteger v5 = [(NSString *)self->_ssid hash];
  if ((*(unsigned char *)&self->_has & 0x80) == 0)
  {
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 8) == 0) {
      goto LABEL_8;
    }
LABEL_11:
    unint64_t v7 = 2654435761u * self->_trigger;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_9;
    }
    goto LABEL_12;
  }
  uint64_t v6 = 2654435761 * self->_securityType;
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    goto LABEL_11;
  }
LABEL_8:
  unint64_t v7 = 0;
  if (*(unsigned char *)&self->_has)
  {
LABEL_9:
    unint64_t v8 = 2654435761u * self->_blacklistDuration;
    goto LABEL_13;
  }
LABEL_12:
  unint64_t v8 = 0;
LABEL_13:
  NSUInteger v9 = [(NSString *)self->_apuuid hash];
  if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    unint64_t v10 = 0;
    if ((*(unsigned char *)&self->_has & 0x40) != 0) {
      goto LABEL_15;
    }
LABEL_18:
    uint64_t v11 = 0;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_16;
    }
LABEL_19:
    uint64_t v12 = 0;
    return v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v5 ^ v9 ^ v10 ^ v11 ^ v12;
  }
  unint64_t v10 = 2654435761u * self->_dstChange;
  if ((*(unsigned char *)&self->_has & 0x40) == 0) {
    goto LABEL_18;
  }
LABEL_15:
  uint64_t v11 = 2654435761 * self->_moState;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    goto LABEL_19;
  }
LABEL_16:
  uint64_t v12 = 2654435761 * self->_locState;
  return v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v5 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  char v5 = *((unsigned char *)a3 + 72);
  if ((v5 & 4) != 0)
  {
    self->_timestamp = *((void *)a3 + 3);
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)a3 + 72);
  }
  if ((v5 & 0x10) != 0)
  {
    self->_eventType = *((_DWORD *)a3 + 12);
    *(unsigned char *)&self->_has |= 0x10u;
  }
  if (*((void *)a3 + 8)) {
    -[AWDWiFiMetricsManagerUserBlacklistEvent setSsid:](self, "setSsid:");
  }
  int v6 = *((char *)a3 + 72);
  if ((v6 & 0x80000000) == 0)
  {
    if ((v6 & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  self->_securityType = *((_DWORD *)a3 + 15);
  *(unsigned char *)&self->_has |= 0x80u;
  LOBYTE(v6) = *((unsigned char *)a3 + 72);
  if ((v6 & 8) != 0)
  {
LABEL_9:
    self->_trigger = *((void *)a3 + 4);
    *(unsigned char *)&self->_has |= 8u;
    LOBYTE(v6) = *((unsigned char *)a3 + 72);
  }
LABEL_10:
  if (v6)
  {
    self->_blacklistDuration = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)a3 + 5)) {
    -[AWDWiFiMetricsManagerUserBlacklistEvent setApuuid:](self, "setApuuid:");
  }
  char v7 = *((unsigned char *)a3 + 72);
  if ((v7 & 2) != 0)
  {
    self->_dstChange = *((void *)a3 + 2);
    *(unsigned char *)&self->_has |= 2u;
    char v7 = *((unsigned char *)a3 + 72);
    if ((v7 & 0x40) == 0)
    {
LABEL_16:
      if ((v7 & 0x20) == 0) {
        return;
      }
      goto LABEL_17;
    }
  }
  else if ((*((unsigned char *)a3 + 72) & 0x40) == 0)
  {
    goto LABEL_16;
  }
  self->_moState = *((_DWORD *)a3 + 14);
  *(unsigned char *)&self->_has |= 0x40u;
  if ((*((unsigned char *)a3 + 72) & 0x20) != 0)
  {
LABEL_17:
    self->_locState = *((_DWORD *)a3 + 13);
    *(unsigned char *)&self->_has |= 0x20u;
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

- (NSString)ssid
{
  return self->_ssid;
}

- (void)setSsid:(id)a3
{
}

- (unsigned)securityType
{
  return self->_securityType;
}

- (unint64_t)trigger
{
  return self->_trigger;
}

- (unint64_t)blacklistDuration
{
  return self->_blacklistDuration;
}

- (NSString)apuuid
{
  return self->_apuuid;
}

- (void)setApuuid:(id)a3
{
}

- (unint64_t)dstChange
{
  return self->_dstChange;
}

- (unsigned)moState
{
  return self->_moState;
}

- (unsigned)locState
{
  return self->_locState;
}

@end