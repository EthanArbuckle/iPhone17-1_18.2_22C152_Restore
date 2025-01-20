@interface AWDPushConnectionConnected
- (BOOL)hasConnectDuration;
- (BOOL)hasConnectionType;
- (BOOL)hasDnsDuration;
- (BOOL)hasDualChannelState;
- (BOOL)hasGuid;
- (BOOL)hasLinkQuality;
- (BOOL)hasTimestamp;
- (BOOL)hasTlsDuration;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)guid;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)linkQuality;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)connectDuration;
- (unsigned)connectionType;
- (unsigned)dnsDuration;
- (unsigned)dualChannelState;
- (unsigned)tlsDuration;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setConnectDuration:(unsigned int)a3;
- (void)setConnectionType:(unsigned int)a3;
- (void)setDnsDuration:(unsigned int)a3;
- (void)setDualChannelState:(unsigned int)a3;
- (void)setGuid:(id)a3;
- (void)setHasConnectDuration:(BOOL)a3;
- (void)setHasConnectionType:(BOOL)a3;
- (void)setHasDnsDuration:(BOOL)a3;
- (void)setHasDualChannelState:(BOOL)a3;
- (void)setHasLinkQuality:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasTlsDuration:(BOOL)a3;
- (void)setLinkQuality:(int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setTlsDuration:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDPushConnectionConnected

- (void)dealloc
{
  [(AWDPushConnectionConnected *)self setGuid:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDPushConnectionConnected;
  [(AWDPushConnectionConnected *)&v3 dealloc];
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

- (void)setConnectDuration:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_connectDuration = a3;
}

- (void)setHasConnectDuration:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasConnectDuration
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setConnectionType:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_connectionType = a3;
}

- (void)setHasConnectionType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasConnectionType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setLinkQuality:(int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_linkQuality = a3;
}

- (void)setHasLinkQuality:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasLinkQuality
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setDualChannelState:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_dualChannelState = a3;
}

- (void)setHasDualChannelState:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasDualChannelState
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setDnsDuration:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_dnsDuration = a3;
}

- (void)setHasDnsDuration:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasDnsDuration
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setTlsDuration:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_tlsDuration = a3;
}

- (void)setHasTlsDuration:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasTlsDuration
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDPushConnectionConnected;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDPushConnectionConnected description](&v3, sel_description), -[AWDPushConnectionConnected dictionaryRepresentation](self, "dictionaryRepresentation")];
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
      if ((has & 4) == 0) {
        goto LABEL_6;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  [v4 setObject:[NSNumber numberWithUnsignedInt:self->_connectDuration] forKey:@"connectDuration"];
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  [v4 setObject:[NSNumber numberWithUnsignedInt:self->_connectionType] forKey:@"connectionType"];
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_16;
  }
LABEL_15:
  [v4 setObject:[NSNumber numberWithInt:self->_linkQuality] forKey:@"linkQuality"];
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 8) == 0) {
      goto LABEL_9;
    }
LABEL_17:
    [v4 setObject:[NSNumber numberWithUnsignedInt:self->_dnsDuration] forKey:@"dnsDuration"];
    if ((*(unsigned char *)&self->_has & 0x40) == 0) {
      return v4;
    }
    goto LABEL_10;
  }
LABEL_16:
  [v4 setObject:[NSNumber numberWithUnsignedInt:self->_dualChannelState] forKey:@"dualChannelState"];
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_17;
  }
LABEL_9:
  if ((has & 0x40) != 0) {
LABEL_10:
  }
    [v4 setObject:[NSNumber numberWithUnsignedInt:self->_tlsDuration] forKey:@"tlsDuration"];
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return AWDPushConnectionConnectedReadFrom((uint64_t)self, (uint64_t)a3);
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
      if ((has & 4) == 0) {
        goto LABEL_6;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 8) == 0) {
      goto LABEL_9;
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
  if ((has & 8) != 0) {
    goto LABEL_16;
  }
LABEL_9:
  if ((has & 0x40) == 0) {
    return;
  }
LABEL_17:

  PBDataWriterWriteUint32Field();
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
    *((unsigned char *)a3 + 48) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0) {
        goto LABEL_6;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)a3 + 4) = self->_connectDuration;
  *((unsigned char *)a3 + 48) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)a3 + 5) = self->_connectionType;
  *((unsigned char *)a3 + 48) |= 4u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)a3 + 10) = self->_linkQuality;
  *((unsigned char *)a3 + 48) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)a3 + 7) = self->_dualChannelState;
  *((unsigned char *)a3 + 48) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 0x40) == 0) {
      return;
    }
    goto LABEL_10;
  }
LABEL_17:
  *((_DWORD *)a3 + 6) = self->_dnsDuration;
  *((unsigned char *)a3 + 48) |= 8u;
  if ((*(unsigned char *)&self->_has & 0x40) == 0) {
    return;
  }
LABEL_10:
  *((_DWORD *)a3 + 11) = self->_tlsDuration;
  *((unsigned char *)a3 + 48) |= 0x40u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init")

  *(void *)(v5 + 32) = [(NSString *)self->_guid copyWithZone:a3];
  char has = (char)self->_has;
  if (has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(unsigned char *)(v5 + 48) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 16) = self->_connectDuration;
  *(unsigned char *)(v5 + 48) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  *(_DWORD *)(v5 + 20) = self->_connectionType;
  *(unsigned char *)(v5 + 48) |= 4u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  *(_DWORD *)(v5 + 40) = self->_linkQuality;
  *(unsigned char *)(v5 + 48) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_7;
    }
LABEL_15:
    *(_DWORD *)(v5 + 24) = self->_dnsDuration;
    *(unsigned char *)(v5 + 48) |= 8u;
    if ((*(unsigned char *)&self->_has & 0x40) == 0) {
      return (id)v5;
    }
    goto LABEL_8;
  }
LABEL_14:
  *(_DWORD *)(v5 + 28) = self->_dualChannelState;
  *(unsigned char *)(v5 + 48) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_15;
  }
LABEL_7:
  if ((has & 0x40) != 0)
  {
LABEL_8:
    *(_DWORD *)(v5 + 44) = self->_tlsDuration;
    *(unsigned char *)(v5 + 48) |= 0x40u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    guid = self->_guid;
    if (!((unint64_t)guid | *((void *)a3 + 4)) || (int v5 = -[NSString isEqual:](guid, "isEqual:")) != 0)
    {
      if (*(unsigned char *)&self->_has)
      {
        if ((*((unsigned char *)a3 + 48) & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
          goto LABEL_38;
        }
      }
      else if (*((unsigned char *)a3 + 48))
      {
LABEL_38:
        LOBYTE(v5) = 0;
        return v5;
      }
      if ((*(unsigned char *)&self->_has & 2) != 0)
      {
        if ((*((unsigned char *)a3 + 48) & 2) == 0 || self->_connectDuration != *((_DWORD *)a3 + 4)) {
          goto LABEL_38;
        }
      }
      else if ((*((unsigned char *)a3 + 48) & 2) != 0)
      {
        goto LABEL_38;
      }
      if ((*(unsigned char *)&self->_has & 4) != 0)
      {
        if ((*((unsigned char *)a3 + 48) & 4) == 0 || self->_connectionType != *((_DWORD *)a3 + 5)) {
          goto LABEL_38;
        }
      }
      else if ((*((unsigned char *)a3 + 48) & 4) != 0)
      {
        goto LABEL_38;
      }
      if ((*(unsigned char *)&self->_has & 0x20) != 0)
      {
        if ((*((unsigned char *)a3 + 48) & 0x20) == 0 || self->_linkQuality != *((_DWORD *)a3 + 10)) {
          goto LABEL_38;
        }
      }
      else if ((*((unsigned char *)a3 + 48) & 0x20) != 0)
      {
        goto LABEL_38;
      }
      if ((*(unsigned char *)&self->_has & 0x10) != 0)
      {
        if ((*((unsigned char *)a3 + 48) & 0x10) == 0 || self->_dualChannelState != *((_DWORD *)a3 + 7)) {
          goto LABEL_38;
        }
      }
      else if ((*((unsigned char *)a3 + 48) & 0x10) != 0)
      {
        goto LABEL_38;
      }
      if ((*(unsigned char *)&self->_has & 8) != 0)
      {
        if ((*((unsigned char *)a3 + 48) & 8) == 0 || self->_dnsDuration != *((_DWORD *)a3 + 6)) {
          goto LABEL_38;
        }
      }
      else if ((*((unsigned char *)a3 + 48) & 8) != 0)
      {
        goto LABEL_38;
      }
      LOBYTE(v5) = (*((unsigned char *)a3 + 48) & 0x40) == 0;
      if ((*(unsigned char *)&self->_has & 0x40) != 0)
      {
        if ((*((unsigned char *)a3 + 48) & 0x40) == 0 || self->_tlsDuration != *((_DWORD *)a3 + 11)) {
          goto LABEL_38;
        }
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
      uint64_t v5 = 2654435761 * self->_connectDuration;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
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
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    uint64_t v6 = 2654435761 * self->_connectionType;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_5:
    uint64_t v7 = 2654435761 * self->_linkQuality;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_6:
    uint64_t v8 = 2654435761 * self->_dualChannelState;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_7;
    }
LABEL_14:
    uint64_t v9 = 0;
    if ((*(unsigned char *)&self->_has & 0x40) != 0) {
      goto LABEL_8;
    }
LABEL_15:
    uint64_t v10 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
  }
LABEL_13:
  uint64_t v8 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_14;
  }
LABEL_7:
  uint64_t v9 = 2654435761 * self->_dnsDuration;
  if ((*(unsigned char *)&self->_has & 0x40) == 0) {
    goto LABEL_15;
  }
LABEL_8:
  uint64_t v10 = 2654435761 * self->_tlsDuration;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 4)) {
    -[AWDPushConnectionConnected setGuid:](self, "setGuid:");
  }
  char v5 = *((unsigned char *)a3 + 48);
  if (v5)
  {
    self->_timestamp = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)a3 + 48);
    if ((v5 & 2) == 0)
    {
LABEL_5:
      if ((v5 & 4) == 0) {
        goto LABEL_6;
      }
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)a3 + 48) & 2) == 0)
  {
    goto LABEL_5;
  }
  self->_connectDuration = *((_DWORD *)a3 + 4);
  *(unsigned char *)&self->_has |= 2u;
  char v5 = *((unsigned char *)a3 + 48);
  if ((v5 & 4) == 0)
  {
LABEL_6:
    if ((v5 & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  self->_connectionType = *((_DWORD *)a3 + 5);
  *(unsigned char *)&self->_has |= 4u;
  char v5 = *((unsigned char *)a3 + 48);
  if ((v5 & 0x20) == 0)
  {
LABEL_7:
    if ((v5 & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_16;
  }
LABEL_15:
  self->_linkQuality = *((_DWORD *)a3 + 10);
  *(unsigned char *)&self->_has |= 0x20u;
  char v5 = *((unsigned char *)a3 + 48);
  if ((v5 & 0x10) == 0)
  {
LABEL_8:
    if ((v5 & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_17;
  }
LABEL_16:
  self->_dualChannelState = *((_DWORD *)a3 + 7);
  *(unsigned char *)&self->_has |= 0x10u;
  char v5 = *((unsigned char *)a3 + 48);
  if ((v5 & 8) == 0)
  {
LABEL_9:
    if ((v5 & 0x40) == 0) {
      return;
    }
    goto LABEL_10;
  }
LABEL_17:
  self->_dnsDuration = *((_DWORD *)a3 + 6);
  *(unsigned char *)&self->_has |= 8u;
  if ((*((unsigned char *)a3 + 48) & 0x40) == 0) {
    return;
  }
LABEL_10:
  self->_tlsDuration = *((_DWORD *)a3 + 11);
  *(unsigned char *)&self->_has |= 0x40u;
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

- (unsigned)connectDuration
{
  return self->_connectDuration;
}

- (unsigned)connectionType
{
  return self->_connectionType;
}

- (int)linkQuality
{
  return self->_linkQuality;
}

- (unsigned)dualChannelState
{
  return self->_dualChannelState;
}

- (unsigned)dnsDuration
{
  return self->_dnsDuration;
}

- (unsigned)tlsDuration
{
  return self->_tlsDuration;
}

@end