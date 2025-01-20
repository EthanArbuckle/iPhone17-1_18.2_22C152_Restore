@interface AWDWiFiMetricsManagerAssociationEvent
- (AWDWiFiMetricsManagerEvent)eventInfo;
- (BOOL)hasEventInfo;
- (BOOL)hasEventType;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)eventTypeAsString:(int)a3;
- (int)StringAsEventType:(id)a3;
- (int)eventType;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setEventInfo:(id)a3;
- (void)setEventType:(int)a3;
- (void)setHasEventType:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDWiFiMetricsManagerAssociationEvent

- (void)dealloc
{
  [(AWDWiFiMetricsManagerAssociationEvent *)self setEventInfo:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsManagerAssociationEvent;
  [(AWDWiFiMetricsManagerAssociationEvent *)&v3 dealloc];
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

- (BOOL)hasEventInfo
{
  return self->_eventInfo != 0;
}

- (int)eventType
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_eventType;
  }
  else {
    return 0;
  }
}

- (void)setEventType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_eventType = a3;
}

- (void)setHasEventType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEventType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)eventTypeAsString:(int)a3
{
  if (a3 >= 6) {
    return (id)[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else {
    return off_2641BA2F8[a3];
  }
}

- (int)StringAsEventType:(id)a3
{
  if ([a3 isEqualToString:@"APPLE80211_JOINASSOC_AUTH_EVENT"]) {
    return 0;
  }
  if ([a3 isEqualToString:@"APPLE80211_JOINASSOC_ASSOC_START_EVENT"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"APPLE80211_JOINASSOC_ASSOC_DONE_EVENT"]) {
    return 2;
  }
  if ([a3 isEqualToString:@"APPLE80211_JOINASSOC_LINK_STATUS_EVENT"]) {
    return 3;
  }
  if ([a3 isEqualToString:@"APPLE80211_JOINASSOC_LINK_CHANGE_EVENT"]) {
    return 4;
  }
  if ([a3 isEqualToString:@"APPLE80211_JOINASSOC_SSID_CHANGE_EVENT"]) {
    return 5;
  }
  return 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsManagerAssociationEvent;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWiFiMetricsManagerAssociationEvent description](&v3, sel_description), -[AWDWiFiMetricsManagerAssociationEvent dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
  }
  eventInfo = self->_eventInfo;
  if (eventInfo) {
    [v3 setObject:eventInfo dictionaryRepresentation] forKey:@"eventInfo"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t eventType = self->_eventType;
    if (eventType >= 6) {
      v6 = (__CFString *)[NSString stringWithFormat:@"(unknown: %i)", self->_eventType];
    }
    else {
      v6 = off_2641BA2F8[eventType];
    }
    [v3 setObject:v6 forKey:@"eventType"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiMetricsManagerAssociationEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_eventInfo) {
    PBDataWriterWriteSubmessage();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
  }
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((unsigned char *)a3 + 28) |= 1u;
  }
  if (self->_eventInfo) {
    [a3 setEventInfo:];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)a3 + 6) = self->_eventType;
    *((unsigned char *)a3 + 28) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [[objc_opt_class() allocWithZone:a3] init];
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(unsigned char *)(v5 + 28) |= 1u;
  }

  *(void *)(v6 + 16) = [(AWDWiFiMetricsManagerEvent *)self->_eventInfo copyWithZone:a3];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v6 + 24) = self->_eventType;
    *(unsigned char *)(v6 + 28) |= 2u;
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
      if ((*((unsigned char *)a3 + 28) & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
        goto LABEL_14;
      }
    }
    else if (*((unsigned char *)a3 + 28))
    {
LABEL_14:
      LOBYTE(v5) = 0;
      return v5;
    }
    eventInfo = self->_eventInfo;
    if ((unint64_t)eventInfo | *((void *)a3 + 2))
    {
      int v5 = -[AWDWiFiMetricsManagerEvent isEqual:](eventInfo, "isEqual:");
      if (!v5) {
        return v5;
      }
      char has = (char)self->_has;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 28) & 2) == 0;
    if ((has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 28) & 2) == 0 || self->_eventType != *((_DWORD *)a3 + 6)) {
        goto LABEL_14;
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
  unint64_t v4 = [(AWDWiFiMetricsManagerEvent *)self->_eventInfo hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v5 = 2654435761 * self->_eventType;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  if (*((unsigned char *)a3 + 28))
  {
    self->_timestamp = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  eventInfo = self->_eventInfo;
  uint64_t v6 = *((void *)a3 + 2);
  if (eventInfo)
  {
    if (v6) {
      -[AWDWiFiMetricsManagerEvent mergeFrom:](eventInfo, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[AWDWiFiMetricsManagerAssociationEvent setEventInfo:](self, "setEventInfo:");
  }
  if ((*((unsigned char *)a3 + 28) & 2) != 0)
  {
    self->_uint64_t eventType = *((_DWORD *)a3 + 6);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (AWDWiFiMetricsManagerEvent)eventInfo
{
  return self->_eventInfo;
}

- (void)setEventInfo:(id)a3
{
}

@end