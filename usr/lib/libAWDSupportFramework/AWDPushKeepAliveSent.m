@interface AWDPushKeepAliveSent
- (BOOL)hasConnectionType;
- (BOOL)hasCurrentGrowthStage;
- (BOOL)hasDualChannelState;
- (BOOL)hasGuid;
- (BOOL)hasKeepAliveACKDuration;
- (BOOL)hasKeepAliveVersion;
- (BOOL)hasLastKeepAliveInterval;
- (BOOL)hasLinkQuality;
- (BOOL)hasNextKeepAliveInterval;
- (BOOL)hasTimeSinceConnected;
- (BOOL)hasTimeSinceLastKeepAlive;
- (BOOL)hasTimeSinceLastSuccessfulKeepAlive;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)guid;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)linkQuality;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)connectionType;
- (unsigned)currentGrowthStage;
- (unsigned)dualChannelState;
- (unsigned)keepAliveACKDuration;
- (unsigned)keepAliveVersion;
- (unsigned)lastKeepAliveInterval;
- (unsigned)nextKeepAliveInterval;
- (unsigned)timeSinceConnected;
- (unsigned)timeSinceLastKeepAlive;
- (unsigned)timeSinceLastSuccessfulKeepAlive;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setConnectionType:(unsigned int)a3;
- (void)setCurrentGrowthStage:(unsigned int)a3;
- (void)setDualChannelState:(unsigned int)a3;
- (void)setGuid:(id)a3;
- (void)setHasConnectionType:(BOOL)a3;
- (void)setHasCurrentGrowthStage:(BOOL)a3;
- (void)setHasDualChannelState:(BOOL)a3;
- (void)setHasKeepAliveACKDuration:(BOOL)a3;
- (void)setHasKeepAliveVersion:(BOOL)a3;
- (void)setHasLastKeepAliveInterval:(BOOL)a3;
- (void)setHasLinkQuality:(BOOL)a3;
- (void)setHasNextKeepAliveInterval:(BOOL)a3;
- (void)setHasTimeSinceConnected:(BOOL)a3;
- (void)setHasTimeSinceLastKeepAlive:(BOOL)a3;
- (void)setHasTimeSinceLastSuccessfulKeepAlive:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setKeepAliveACKDuration:(unsigned int)a3;
- (void)setKeepAliveVersion:(unsigned int)a3;
- (void)setLastKeepAliveInterval:(unsigned int)a3;
- (void)setLinkQuality:(int)a3;
- (void)setNextKeepAliveInterval:(unsigned int)a3;
- (void)setTimeSinceConnected:(unsigned int)a3;
- (void)setTimeSinceLastKeepAlive:(unsigned int)a3;
- (void)setTimeSinceLastSuccessfulKeepAlive:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDPushKeepAliveSent

- (void)dealloc
{
  [(AWDPushKeepAliveSent *)self setGuid:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDPushKeepAliveSent;
  [(AWDPushKeepAliveSent *)&v3 dealloc];
}

- (BOOL)hasGuid
{
  return self->_guid != 0;
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setConnectionType:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_connectionType = a3;
}

- (void)setHasConnectionType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasConnectionType
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setLinkQuality:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_linkQuality = a3;
}

- (void)setHasLinkQuality:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasLinkQuality
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setTimeSinceLastKeepAlive:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_timeSinceLastKeepAlive = a3;
}

- (void)setHasTimeSinceLastKeepAlive:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasTimeSinceLastKeepAlive
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setNextKeepAliveInterval:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_nextKeepAliveInterval = a3;
}

- (void)setHasNextKeepAliveInterval:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasNextKeepAliveInterval
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setKeepAliveACKDuration:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_keepAliveACKDuration = a3;
}

- (void)setHasKeepAliveACKDuration:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasKeepAliveACKDuration
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setDualChannelState:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_dualChannelState = a3;
}

- (void)setHasDualChannelState:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasDualChannelState
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setKeepAliveVersion:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_keepAliveVersion = a3;
}

- (void)setHasKeepAliveVersion:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasKeepAliveVersion
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setLastKeepAliveInterval:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_lastKeepAliveInterval = a3;
}

- (void)setHasLastKeepAliveInterval:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasLastKeepAliveInterval
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setTimeSinceConnected:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_timeSinceConnected = a3;
}

- (void)setHasTimeSinceConnected:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasTimeSinceConnected
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setTimeSinceLastSuccessfulKeepAlive:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_timeSinceLastSuccessfulKeepAlive = a3;
}

- (void)setHasTimeSinceLastSuccessfulKeepAlive:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasTimeSinceLastSuccessfulKeepAlive
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setCurrentGrowthStage:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_currentGrowthStage = a3;
}

- (void)setHasCurrentGrowthStage:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasCurrentGrowthStage
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDPushKeepAliveSent;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDPushKeepAliveSent description](&v3, sel_description), -[AWDPushKeepAliveSent dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  guid = self->_guid;
  if (guid) {
    [v3 setObject:guid forKey:@"guid"];
  }
  __int16 has = (__int16)self->_has;
  if (has)
  {
    [v4 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 0x80) == 0) {
        goto LABEL_6;
      }
      goto LABEL_19;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_5;
  }
  [v4 setObject:[NSNumber numberWithUnsignedInt:self->_connectionType] forKey:@"connectionType"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x400) == 0) {
      goto LABEL_7;
    }
    goto LABEL_20;
  }
LABEL_19:
  [v4 setObject:[NSNumber numberWithInt:self->_linkQuality] forKey:@"linkQuality"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_7:
    if ((has & 0x100) == 0) {
      goto LABEL_8;
    }
    goto LABEL_21;
  }
LABEL_20:
  [v4 setObject:[NSNumber numberWithUnsignedInt:self->_timeSinceLastKeepAlive] forKey:@"timeSinceLastKeepAlive"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_22;
  }
LABEL_21:
  [v4 setObject:[NSNumber numberWithUnsignedInt:self->_nextKeepAliveInterval] forKey:@"nextKeepAliveInterval"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_9:
    if ((has & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_23;
  }
LABEL_22:
  [v4 setObject:[NSNumber numberWithUnsignedInt:self->_keepAliveACKDuration] forKey:@"keepAliveACKDuration"];
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_10:
    if ((has & 0x20) == 0) {
      goto LABEL_11;
    }
    goto LABEL_24;
  }
LABEL_23:
  [v4 setObject:[NSNumber numberWithUnsignedInt:self->_dualChannelState] forKey:@"dualChannelState"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_11:
    if ((has & 0x40) == 0) {
      goto LABEL_12;
    }
    goto LABEL_25;
  }
LABEL_24:
  [v4 setObject:[NSNumber numberWithUnsignedInt:self->_keepAliveVersion] forKey:@"keepAliveVersion"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_12:
    if ((has & 0x200) == 0) {
      goto LABEL_13;
    }
    goto LABEL_26;
  }
LABEL_25:
  [v4 setObject:[NSNumber numberWithUnsignedInt:self->_lastKeepAliveInterval] forKey:@"lastKeepAliveInterval"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_13:
    if ((has & 0x800) == 0) {
      goto LABEL_14;
    }
LABEL_27:
    [v4 setObject:[NSNumber numberWithUnsignedInt:self->_timeSinceLastSuccessfulKeepAlive] forKey:@"timeSinceLastSuccessfulKeepAlive"];
    if ((*(_WORD *)&self->_has & 4) == 0) {
      return v4;
    }
    goto LABEL_15;
  }
LABEL_26:
  [v4 setObject:[NSNumber numberWithUnsignedInt:self->_timeSinceConnected] forKey:@"timeSinceConnected"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) != 0) {
    goto LABEL_27;
  }
LABEL_14:
  if ((has & 4) != 0) {
LABEL_15:
  }
    [v4 setObject:[NSNumber numberWithUnsignedInt:self->_currentGrowthStage] forKey:@"currentGrowthStage"];
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return AWDPushKeepAliveSentReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_guid) {
    PBDataWriterWriteStringField();
  }
  __int16 has = (__int16)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 0x80) == 0) {
        goto LABEL_6;
      }
      goto LABEL_18;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x400) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_7:
    if ((has & 0x100) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_9:
    if ((has & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_10:
    if ((has & 0x20) == 0) {
      goto LABEL_11;
    }
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_11:
    if ((has & 0x40) == 0) {
      goto LABEL_12;
    }
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_12:
    if ((has & 0x200) == 0) {
      goto LABEL_13;
    }
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_13:
    if ((has & 0x800) == 0) {
      goto LABEL_14;
    }
LABEL_26:
    PBDataWriterWriteUint32Field();
    if ((*(_WORD *)&self->_has & 4) == 0) {
      return;
    }
    goto LABEL_27;
  }
LABEL_25:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) != 0) {
    goto LABEL_26;
  }
LABEL_14:
  if ((has & 4) == 0) {
    return;
  }
LABEL_27:

  PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  if (self->_guid) {
    [a3 setGuid:];
  }
  __int16 has = (__int16)self->_has;
  if (has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((_WORD *)a3 + 36) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 0x80) == 0) {
        goto LABEL_6;
      }
      goto LABEL_19;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)a3 + 4) = self->_connectionType;
  *((_WORD *)a3 + 36) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x400) == 0) {
      goto LABEL_7;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)a3 + 13) = self->_linkQuality;
  *((_WORD *)a3 + 36) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_7:
    if ((has & 0x100) == 0) {
      goto LABEL_8;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)a3 + 16) = self->_timeSinceLastKeepAlive;
  *((_WORD *)a3 + 36) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)a3 + 14) = self->_nextKeepAliveInterval;
  *((_WORD *)a3 + 36) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_9:
    if ((has & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)a3 + 10) = self->_keepAliveACKDuration;
  *((_WORD *)a3 + 36) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_10:
    if ((has & 0x20) == 0) {
      goto LABEL_11;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)a3 + 6) = self->_dualChannelState;
  *((_WORD *)a3 + 36) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_11:
    if ((has & 0x40) == 0) {
      goto LABEL_12;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)a3 + 11) = self->_keepAliveVersion;
  *((_WORD *)a3 + 36) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_12:
    if ((has & 0x200) == 0) {
      goto LABEL_13;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)a3 + 12) = self->_lastKeepAliveInterval;
  *((_WORD *)a3 + 36) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_13:
    if ((has & 0x800) == 0) {
      goto LABEL_14;
    }
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)a3 + 15) = self->_timeSinceConnected;
  *((_WORD *)a3 + 36) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_14:
    if ((has & 4) == 0) {
      return;
    }
    goto LABEL_15;
  }
LABEL_27:
  *((_DWORD *)a3 + 17) = self->_timeSinceLastSuccessfulKeepAlive;
  *((_WORD *)a3 + 36) |= 0x800u;
  if ((*(_WORD *)&self->_has & 4) == 0) {
    return;
  }
LABEL_15:
  *((_DWORD *)a3 + 5) = self->_currentGrowthStage;
  *((_WORD *)a3 + 36) |= 4u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [[objc_opt_class() allocWithZone:a3] init];

  *(void *)(v5 + 32) = [(NSString *)self->_guid copyWithZone:a3];
  __int16 has = (__int16)self->_has;
  if (has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(_WORD *)(v5 + 72) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 16) = self->_connectionType;
  *(_WORD *)(v5 + 72) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 0x400) == 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
LABEL_17:
  *(_DWORD *)(v5 + 52) = self->_linkQuality;
  *(_WORD *)(v5 + 72) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_5:
    if ((has & 0x100) == 0) {
      goto LABEL_6;
    }
    goto LABEL_19;
  }
LABEL_18:
  *(_DWORD *)(v5 + 64) = self->_timeSinceLastKeepAlive;
  *(_WORD *)(v5 + 72) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_20;
  }
LABEL_19:
  *(_DWORD *)(v5 + 56) = self->_nextKeepAliveInterval;
  *(_WORD *)(v5 + 72) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_21;
  }
LABEL_20:
  *(_DWORD *)(v5 + 40) = self->_keepAliveACKDuration;
  *(_WORD *)(v5 + 72) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_22;
  }
LABEL_21:
  *(_DWORD *)(v5 + 24) = self->_dualChannelState;
  *(_WORD *)(v5 + 72) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 0x40) == 0) {
      goto LABEL_10;
    }
    goto LABEL_23;
  }
LABEL_22:
  *(_DWORD *)(v5 + 44) = self->_keepAliveVersion;
  *(_WORD *)(v5 + 72) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_24;
  }
LABEL_23:
  *(_DWORD *)(v5 + 48) = self->_lastKeepAliveInterval;
  *(_WORD *)(v5 + 72) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_11:
    if ((has & 0x800) == 0) {
      goto LABEL_12;
    }
LABEL_25:
    *(_DWORD *)(v5 + 68) = self->_timeSinceLastSuccessfulKeepAlive;
    *(_WORD *)(v5 + 72) |= 0x800u;
    if ((*(_WORD *)&self->_has & 4) == 0) {
      return (id)v5;
    }
    goto LABEL_13;
  }
LABEL_24:
  *(_DWORD *)(v5 + 60) = self->_timeSinceConnected;
  *(_WORD *)(v5 + 72) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) != 0) {
    goto LABEL_25;
  }
LABEL_12:
  if ((has & 4) != 0)
  {
LABEL_13:
    *(_DWORD *)(v5 + 20) = self->_currentGrowthStage;
    *(_WORD *)(v5 + 72) |= 4u;
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
      __int16 has = (__int16)self->_has;
      __int16 v8 = *((_WORD *)a3 + 36);
      if (has)
      {
        if ((v8 & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
          goto LABEL_63;
        }
      }
      else if (v8)
      {
LABEL_63:
        LOBYTE(v5) = 0;
        return v5;
      }
      if ((has & 2) != 0)
      {
        if ((v8 & 2) == 0 || self->_connectionType != *((_DWORD *)a3 + 4)) {
          goto LABEL_63;
        }
      }
      else if ((v8 & 2) != 0)
      {
        goto LABEL_63;
      }
      if ((has & 0x80) != 0)
      {
        if ((v8 & 0x80) == 0 || self->_linkQuality != *((_DWORD *)a3 + 13)) {
          goto LABEL_63;
        }
      }
      else if ((v8 & 0x80) != 0)
      {
        goto LABEL_63;
      }
      if ((*(_WORD *)&self->_has & 0x400) != 0)
      {
        if ((*((_WORD *)a3 + 36) & 0x400) == 0 || self->_timeSinceLastKeepAlive != *((_DWORD *)a3 + 16)) {
          goto LABEL_63;
        }
      }
      else if ((*((_WORD *)a3 + 36) & 0x400) != 0)
      {
        goto LABEL_63;
      }
      if ((*(_WORD *)&self->_has & 0x100) != 0)
      {
        if ((*((_WORD *)a3 + 36) & 0x100) == 0 || self->_nextKeepAliveInterval != *((_DWORD *)a3 + 14)) {
          goto LABEL_63;
        }
      }
      else if ((*((_WORD *)a3 + 36) & 0x100) != 0)
      {
        goto LABEL_63;
      }
      if ((has & 0x10) != 0)
      {
        if ((v8 & 0x10) == 0 || self->_keepAliveACKDuration != *((_DWORD *)a3 + 10)) {
          goto LABEL_63;
        }
      }
      else if ((v8 & 0x10) != 0)
      {
        goto LABEL_63;
      }
      if ((has & 8) != 0)
      {
        if ((v8 & 8) == 0 || self->_dualChannelState != *((_DWORD *)a3 + 6)) {
          goto LABEL_63;
        }
      }
      else if ((v8 & 8) != 0)
      {
        goto LABEL_63;
      }
      if ((has & 0x20) != 0)
      {
        if ((v8 & 0x20) == 0 || self->_keepAliveVersion != *((_DWORD *)a3 + 11)) {
          goto LABEL_63;
        }
      }
      else if ((v8 & 0x20) != 0)
      {
        goto LABEL_63;
      }
      if ((has & 0x40) != 0)
      {
        if ((v8 & 0x40) == 0 || self->_lastKeepAliveInterval != *((_DWORD *)a3 + 12)) {
          goto LABEL_63;
        }
      }
      else if ((v8 & 0x40) != 0)
      {
        goto LABEL_63;
      }
      if ((*(_WORD *)&self->_has & 0x200) != 0)
      {
        if ((*((_WORD *)a3 + 36) & 0x200) == 0 || self->_timeSinceConnected != *((_DWORD *)a3 + 15)) {
          goto LABEL_63;
        }
      }
      else if ((*((_WORD *)a3 + 36) & 0x200) != 0)
      {
        goto LABEL_63;
      }
      if ((*(_WORD *)&self->_has & 0x800) != 0)
      {
        if ((*((_WORD *)a3 + 36) & 0x800) == 0 || self->_timeSinceLastSuccessfulKeepAlive != *((_DWORD *)a3 + 17)) {
          goto LABEL_63;
        }
      }
      else if ((*((_WORD *)a3 + 36) & 0x800) != 0)
      {
        goto LABEL_63;
      }
      LOBYTE(v5) = (v8 & 4) == 0;
      if ((has & 4) != 0)
      {
        if ((v8 & 4) == 0 || self->_currentGrowthStage != *((_DWORD *)a3 + 5)) {
          goto LABEL_63;
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
  __int16 has = (__int16)self->_has;
  if (has)
  {
    unint64_t v5 = 2654435761u * self->_timestamp;
    if ((has & 2) != 0)
    {
LABEL_3:
      uint64_t v6 = 2654435761 * self->_connectionType;
      if ((has & 0x80) != 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else
  {
    unint64_t v5 = 0;
    if ((has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v6 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_4:
    uint64_t v7 = 2654435761 * self->_linkQuality;
    if ((*(_WORD *)&self->_has & 0x400) != 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v7 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_5:
    uint64_t v8 = 2654435761 * self->_timeSinceLastKeepAlive;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v8 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_6:
    uint64_t v9 = 2654435761 * self->_nextKeepAliveInterval;
    if ((has & 0x10) != 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v9 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_7:
    uint64_t v10 = 2654435761 * self->_keepAliveACKDuration;
    if ((has & 8) != 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  uint64_t v10 = 0;
  if ((has & 8) != 0)
  {
LABEL_8:
    uint64_t v11 = 2654435761 * self->_dualChannelState;
    if ((has & 0x20) != 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v11 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_9:
    uint64_t v12 = 2654435761 * self->_keepAliveVersion;
    if ((has & 0x40) != 0) {
      goto LABEL_10;
    }
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v12 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_10:
    uint64_t v13 = 2654435761 * self->_lastKeepAliveInterval;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_11;
    }
    goto LABEL_23;
  }
LABEL_22:
  uint64_t v13 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_11:
    uint64_t v14 = 2654435761 * self->_timeSinceConnected;
    if ((*(_WORD *)&self->_has & 0x800) != 0) {
      goto LABEL_12;
    }
LABEL_24:
    uint64_t v15 = 0;
    if ((has & 4) != 0) {
      goto LABEL_13;
    }
LABEL_25:
    uint64_t v16 = 0;
    return v5 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16;
  }
LABEL_23:
  uint64_t v14 = 0;
  if ((*(_WORD *)&self->_has & 0x800) == 0) {
    goto LABEL_24;
  }
LABEL_12:
  uint64_t v15 = 2654435761 * self->_timeSinceLastSuccessfulKeepAlive;
  if ((has & 4) == 0) {
    goto LABEL_25;
  }
LABEL_13:
  uint64_t v16 = 2654435761 * self->_currentGrowthStage;
  return v5 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16;
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 4)) {
    -[AWDPushKeepAliveSent setGuid:](self, "setGuid:");
  }
  __int16 v5 = *((_WORD *)a3 + 36);
  if (v5)
  {
    self->_timestamp = *((void *)a3 + 1);
    *(_WORD *)&self->_has |= 1u;
    __int16 v5 = *((_WORD *)a3 + 36);
    if ((v5 & 2) == 0)
    {
LABEL_5:
      if ((v5 & 0x80) == 0) {
        goto LABEL_6;
      }
      goto LABEL_19;
    }
  }
  else if ((v5 & 2) == 0)
  {
    goto LABEL_5;
  }
  self->_connectionType = *((_DWORD *)a3 + 4);
  *(_WORD *)&self->_has |= 2u;
  __int16 v5 = *((_WORD *)a3 + 36);
  if ((v5 & 0x80) == 0)
  {
LABEL_6:
    if ((v5 & 0x400) == 0) {
      goto LABEL_7;
    }
    goto LABEL_20;
  }
LABEL_19:
  self->_linkQuality = *((_DWORD *)a3 + 13);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v5 = *((_WORD *)a3 + 36);
  if ((v5 & 0x400) == 0)
  {
LABEL_7:
    if ((v5 & 0x100) == 0) {
      goto LABEL_8;
    }
    goto LABEL_21;
  }
LABEL_20:
  self->_timeSinceLastKeepAlive = *((_DWORD *)a3 + 16);
  *(_WORD *)&self->_has |= 0x400u;
  __int16 v5 = *((_WORD *)a3 + 36);
  if ((v5 & 0x100) == 0)
  {
LABEL_8:
    if ((v5 & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_22;
  }
LABEL_21:
  self->_nextKeepAliveInterval = *((_DWORD *)a3 + 14);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v5 = *((_WORD *)a3 + 36);
  if ((v5 & 0x10) == 0)
  {
LABEL_9:
    if ((v5 & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_23;
  }
LABEL_22:
  self->_keepAliveACKDuration = *((_DWORD *)a3 + 10);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v5 = *((_WORD *)a3 + 36);
  if ((v5 & 8) == 0)
  {
LABEL_10:
    if ((v5 & 0x20) == 0) {
      goto LABEL_11;
    }
    goto LABEL_24;
  }
LABEL_23:
  self->_dualChannelState = *((_DWORD *)a3 + 6);
  *(_WORD *)&self->_has |= 8u;
  __int16 v5 = *((_WORD *)a3 + 36);
  if ((v5 & 0x20) == 0)
  {
LABEL_11:
    if ((v5 & 0x40) == 0) {
      goto LABEL_12;
    }
    goto LABEL_25;
  }
LABEL_24:
  self->_keepAliveVersion = *((_DWORD *)a3 + 11);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v5 = *((_WORD *)a3 + 36);
  if ((v5 & 0x40) == 0)
  {
LABEL_12:
    if ((v5 & 0x200) == 0) {
      goto LABEL_13;
    }
    goto LABEL_26;
  }
LABEL_25:
  self->_lastKeepAliveInterval = *((_DWORD *)a3 + 12);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v5 = *((_WORD *)a3 + 36);
  if ((v5 & 0x200) == 0)
  {
LABEL_13:
    if ((v5 & 0x800) == 0) {
      goto LABEL_14;
    }
    goto LABEL_27;
  }
LABEL_26:
  self->_timeSinceConnected = *((_DWORD *)a3 + 15);
  *(_WORD *)&self->_has |= 0x200u;
  __int16 v5 = *((_WORD *)a3 + 36);
  if ((v5 & 0x800) == 0)
  {
LABEL_14:
    if ((v5 & 4) == 0) {
      return;
    }
    goto LABEL_15;
  }
LABEL_27:
  self->_timeSinceLastSuccessfulKeepAlive = *((_DWORD *)a3 + 17);
  *(_WORD *)&self->_has |= 0x800u;
  if ((*((_WORD *)a3 + 36) & 4) == 0) {
    return;
  }
LABEL_15:
  self->_currentGrowthStage = *((_DWORD *)a3 + 5);
  *(_WORD *)&self->_has |= 4u;
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

- (unsigned)timeSinceLastKeepAlive
{
  return self->_timeSinceLastKeepAlive;
}

- (unsigned)nextKeepAliveInterval
{
  return self->_nextKeepAliveInterval;
}

- (unsigned)keepAliveACKDuration
{
  return self->_keepAliveACKDuration;
}

- (unsigned)dualChannelState
{
  return self->_dualChannelState;
}

- (unsigned)keepAliveVersion
{
  return self->_keepAliveVersion;
}

- (unsigned)lastKeepAliveInterval
{
  return self->_lastKeepAliveInterval;
}

- (unsigned)timeSinceConnected
{
  return self->_timeSinceConnected;
}

- (unsigned)timeSinceLastSuccessfulKeepAlive
{
  return self->_timeSinceLastSuccessfulKeepAlive;
}

- (unsigned)currentGrowthStage
{
  return self->_currentGrowthStage;
}

@end