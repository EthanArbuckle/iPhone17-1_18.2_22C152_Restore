@interface AWDPushReceivedDropped
- (BOOL)hasConnectionType;
- (BOOL)hasDualChannelState;
- (BOOL)hasGuid;
- (BOOL)hasIsFromStorage;
- (BOOL)hasLinkQuality;
- (BOOL)hasPayloadSize;
- (BOOL)hasReceiveOffset;
- (BOOL)hasTimestamp;
- (BOOL)hasTopic;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)guid;
- (NSString)topic;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)linkQuality;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)connectionType;
- (unsigned)dualChannelState;
- (unsigned)isFromStorage;
- (unsigned)payloadSize;
- (unsigned)receiveOffset;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setConnectionType:(unsigned int)a3;
- (void)setDualChannelState:(unsigned int)a3;
- (void)setGuid:(id)a3;
- (void)setHasConnectionType:(BOOL)a3;
- (void)setHasDualChannelState:(BOOL)a3;
- (void)setHasIsFromStorage:(BOOL)a3;
- (void)setHasLinkQuality:(BOOL)a3;
- (void)setHasPayloadSize:(BOOL)a3;
- (void)setHasReceiveOffset:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setIsFromStorage:(unsigned int)a3;
- (void)setLinkQuality:(int)a3;
- (void)setPayloadSize:(unsigned int)a3;
- (void)setReceiveOffset:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setTopic:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDPushReceivedDropped

- (void)dealloc
{
  [(AWDPushReceivedDropped *)self setGuid:0];
  [(AWDPushReceivedDropped *)self setTopic:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDPushReceivedDropped;
  [(AWDPushReceivedDropped *)&v3 dealloc];
}

- (BOOL)hasGuid
{
  return self->_guid != 0;
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

- (void)setConnectionType:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_connectionType = a3;
}

- (void)setHasConnectionType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasConnectionType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setLinkQuality:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_linkQuality = a3;
}

- (void)setHasLinkQuality:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasLinkQuality
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setReceiveOffset:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_receiveOffset = a3;
}

- (void)setHasReceiveOffset:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasReceiveOffset
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setPayloadSize:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_payloadSize = a3;
}

- (void)setHasPayloadSize:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasPayloadSize
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setIsFromStorage:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_isFromStorage = a3;
}

- (void)setHasIsFromStorage:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIsFromStorage
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setDualChannelState:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_dualChannelState = a3;
}

- (void)setHasDualChannelState:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDualChannelState
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasTopic
{
  return self->_topic != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDPushReceivedDropped;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDPushReceivedDropped description](&v3, sel_description), -[AWDPushReceivedDropped dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  guid = self->_guid;
  if (guid) {
    [v3 setObject:guid forKey:@"guid"];
  }
  char has = (char)self->_has;
  if (has)
  {
    [v4 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 0x10) == 0) {
        goto LABEL_6;
      }
      goto LABEL_16;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  [v4 setObject:[NSNumber numberWithUnsignedInt:self->_connectionType] forKey:@"connectionType"];
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  [v4 setObject:[NSNumber numberWithInt:self->_linkQuality] forKey:@"linkQuality"];
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_18;
  }
LABEL_17:
  [v4 setObject:[NSNumber numberWithUnsignedInt:self->_receiveOffset] forKey:@"receiveOffset"];
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  [v4 setObject:[NSNumber numberWithUnsignedInt:self->_payloadSize] forKey:@"payloadSize"];
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 4) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_19:
  [v4 setObject:[NSNumber numberWithUnsignedInt:self->_isFromStorage] forKey:@"isFromStorage"];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
LABEL_10:
  }
    [v4 setObject:[NSNumber numberWithUnsignedInt:self->_dualChannelState] forKey:@"dualChannelState"];
LABEL_11:
  topic = self->_topic;
  if (topic) {
    [v4 setObject:topic forKey:@"topic"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return AWDPushReceivedDroppedReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_guid) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 0x10) == 0) {
        goto LABEL_6;
      }
      goto LABEL_17;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 4) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_20:
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 4) != 0) {
LABEL_10:
  }
    PBDataWriterWriteUint32Field();
LABEL_11:
  if (self->_topic)
  {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  if (self->_guid) {
    [a3 setGuid:];
  }
  char has = (char)self->_has;
  if (has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((unsigned char *)a3 + 56) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 0x10) == 0) {
        goto LABEL_6;
      }
      goto LABEL_17;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)a3 + 4) = self->_connectionType;
  *((unsigned char *)a3 + 56) |= 2u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)a3 + 9) = self->_linkQuality;
  *((unsigned char *)a3 + 56) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)a3 + 11) = self->_receiveOffset;
  *((unsigned char *)a3 + 56) |= 0x40u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)a3 + 10) = self->_payloadSize;
  *((unsigned char *)a3 + 56) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 4) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_20:
  *((_DWORD *)a3 + 8) = self->_isFromStorage;
  *((unsigned char *)a3 + 56) |= 8u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_10:
    *((_DWORD *)a3 + 5) = self->_dualChannelState;
    *((unsigned char *)a3 + 56) |= 4u;
  }
LABEL_11:
  if (self->_topic)
  {
    [a3 setTopic:];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [[objc_opt_class() allocWithZone:a3] init];

  *(void *)(v5 + 24) = [(NSString *)self->_guid copyWithZone:a3];
  char has = (char)self->_has;
  if (has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(unsigned char *)(v5 + 56) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 16) = self->_connectionType;
  *(unsigned char *)(v5 + 56) |= 2u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  *(_DWORD *)(v5 + 36) = self->_linkQuality;
  *(unsigned char *)(v5 + 56) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  *(_DWORD *)(v5 + 44) = self->_receiveOffset;
  *(unsigned char *)(v5 + 56) |= 0x40u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_7;
    }
LABEL_15:
    *(_DWORD *)(v5 + 32) = self->_isFromStorage;
    *(unsigned char *)(v5 + 56) |= 8u;
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_14:
  *(_DWORD *)(v5 + 40) = self->_payloadSize;
  *(unsigned char *)(v5 + 56) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_15;
  }
LABEL_7:
  if ((has & 4) != 0)
  {
LABEL_8:
    *(_DWORD *)(v5 + 20) = self->_dualChannelState;
    *(unsigned char *)(v5 + 56) |= 4u;
  }
LABEL_9:

  *(void *)(v5 + 48) = [(NSString *)self->_topic copyWithZone:a3];
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    guid = self->_guid;
    if (!((unint64_t)guid | *((void *)a3 + 3)) || (int v5 = -[NSString isEqual:](guid, "isEqual:")) != 0)
    {
      if (*(unsigned char *)&self->_has)
      {
        if ((*((unsigned char *)a3 + 56) & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
          goto LABEL_41;
        }
      }
      else if (*((unsigned char *)a3 + 56))
      {
LABEL_41:
        LOBYTE(v5) = 0;
        return v5;
      }
      if ((*(unsigned char *)&self->_has & 2) != 0)
      {
        if ((*((unsigned char *)a3 + 56) & 2) == 0 || self->_connectionType != *((_DWORD *)a3 + 4)) {
          goto LABEL_41;
        }
      }
      else if ((*((unsigned char *)a3 + 56) & 2) != 0)
      {
        goto LABEL_41;
      }
      if ((*(unsigned char *)&self->_has & 0x10) != 0)
      {
        if ((*((unsigned char *)a3 + 56) & 0x10) == 0 || self->_linkQuality != *((_DWORD *)a3 + 9)) {
          goto LABEL_41;
        }
      }
      else if ((*((unsigned char *)a3 + 56) & 0x10) != 0)
      {
        goto LABEL_41;
      }
      if ((*(unsigned char *)&self->_has & 0x40) != 0)
      {
        if ((*((unsigned char *)a3 + 56) & 0x40) == 0 || self->_receiveOffset != *((_DWORD *)a3 + 11)) {
          goto LABEL_41;
        }
      }
      else if ((*((unsigned char *)a3 + 56) & 0x40) != 0)
      {
        goto LABEL_41;
      }
      if ((*(unsigned char *)&self->_has & 0x20) != 0)
      {
        if ((*((unsigned char *)a3 + 56) & 0x20) == 0 || self->_payloadSize != *((_DWORD *)a3 + 10)) {
          goto LABEL_41;
        }
      }
      else if ((*((unsigned char *)a3 + 56) & 0x20) != 0)
      {
        goto LABEL_41;
      }
      if ((*(unsigned char *)&self->_has & 8) != 0)
      {
        if ((*((unsigned char *)a3 + 56) & 8) == 0 || self->_isFromStorage != *((_DWORD *)a3 + 8)) {
          goto LABEL_41;
        }
      }
      else if ((*((unsigned char *)a3 + 56) & 8) != 0)
      {
        goto LABEL_41;
      }
      if ((*(unsigned char *)&self->_has & 4) != 0)
      {
        if ((*((unsigned char *)a3 + 56) & 4) == 0 || self->_dualChannelState != *((_DWORD *)a3 + 5)) {
          goto LABEL_41;
        }
      }
      else if ((*((unsigned char *)a3 + 56) & 4) != 0)
      {
        goto LABEL_41;
      }
      topic = self->_topic;
      if ((unint64_t)topic | *((void *)a3 + 6))
      {
        LOBYTE(v5) = -[NSString isEqual:](topic, "isEqual:");
      }
      else
      {
        LOBYTE(v5) = 1;
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_guid hash];
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v4 = 2654435761u * self->_timestamp;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_connectionType;
      if ((*(unsigned char *)&self->_has & 0x10) != 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else
  {
    unint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_4:
    uint64_t v6 = 2654435761 * self->_linkQuality;
    if ((*(unsigned char *)&self->_has & 0x40) != 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
LABEL_5:
    uint64_t v7 = 2654435761 * self->_receiveOffset;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_6:
    uint64_t v8 = 2654435761 * self->_payloadSize;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_7;
    }
LABEL_14:
    uint64_t v9 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_8;
    }
LABEL_15:
    uint64_t v10 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ [(NSString *)self->_topic hash];
  }
LABEL_13:
  uint64_t v8 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_14;
  }
LABEL_7:
  uint64_t v9 = 2654435761 * self->_isFromStorage;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_15;
  }
LABEL_8:
  uint64_t v10 = 2654435761 * self->_dualChannelState;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ [(NSString *)self->_topic hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 3)) {
    -[AWDPushReceivedDropped setGuid:](self, "setGuid:");
  }
  char v5 = *((unsigned char *)a3 + 56);
  if (v5)
  {
    self->_timestamp = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)a3 + 56);
    if ((v5 & 2) == 0)
    {
LABEL_5:
      if ((v5 & 0x10) == 0) {
        goto LABEL_6;
      }
      goto LABEL_17;
    }
  }
  else if ((*((unsigned char *)a3 + 56) & 2) == 0)
  {
    goto LABEL_5;
  }
  self->_connectionType = *((_DWORD *)a3 + 4);
  *(unsigned char *)&self->_has |= 2u;
  char v5 = *((unsigned char *)a3 + 56);
  if ((v5 & 0x10) == 0)
  {
LABEL_6:
    if ((v5 & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  self->_linkQuality = *((_DWORD *)a3 + 9);
  *(unsigned char *)&self->_has |= 0x10u;
  char v5 = *((unsigned char *)a3 + 56);
  if ((v5 & 0x40) == 0)
  {
LABEL_7:
    if ((v5 & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  self->_receiveOffset = *((_DWORD *)a3 + 11);
  *(unsigned char *)&self->_has |= 0x40u;
  char v5 = *((unsigned char *)a3 + 56);
  if ((v5 & 0x20) == 0)
  {
LABEL_8:
    if ((v5 & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_20;
  }
LABEL_19:
  self->_payloadSize = *((_DWORD *)a3 + 10);
  *(unsigned char *)&self->_has |= 0x20u;
  char v5 = *((unsigned char *)a3 + 56);
  if ((v5 & 8) == 0)
  {
LABEL_9:
    if ((v5 & 4) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_20:
  self->_isFromStorage = *((_DWORD *)a3 + 8);
  *(unsigned char *)&self->_has |= 8u;
  if ((*((unsigned char *)a3 + 56) & 4) != 0)
  {
LABEL_10:
    self->_dualChannelState = *((_DWORD *)a3 + 5);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_11:
  if (*((void *)a3 + 6))
  {
    -[AWDPushReceivedDropped setTopic:](self, "setTopic:");
  }
}

- (NSString)guid
{
  return self->_guid;
}

- (void)setGuid:(id)a3
{
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)connectionType
{
  return self->_connectionType;
}

- (int)linkQuality
{
  return self->_linkQuality;
}

- (unsigned)receiveOffset
{
  return self->_receiveOffset;
}

- (unsigned)payloadSize
{
  return self->_payloadSize;
}

- (unsigned)isFromStorage
{
  return self->_isFromStorage;
}

- (unsigned)dualChannelState
{
  return self->_dualChannelState;
}

- (NSString)topic
{
  return self->_topic;
}

- (void)setTopic:(id)a3
{
}

@end