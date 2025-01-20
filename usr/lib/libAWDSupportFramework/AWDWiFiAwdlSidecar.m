@interface AWDWiFiAwdlSidecar
- (AWDSidecarBssSteering)sidecarBssSteering;
- (AWDSidecarPeerTraffic)sidecarPeerTraffic;
- (BOOL)hasBgDuration;
- (BOOL)hasBgEntryCount;
- (BOOL)hasDfspState;
- (BOOL)hasFgDuration;
- (BOOL)hasInfraDisconnectedCount;
- (BOOL)hasIsSDB;
- (BOOL)hasPeerRssi24G;
- (BOOL)hasPeerRssi5G;
- (BOOL)hasSidecarBssSteering;
- (BOOL)hasSidecarPeerTraffic;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSDB;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)peerRssi24G;
- (int)peerRssi5G;
- (unint64_t)bgDuration;
- (unint64_t)channelSequencesCount;
- (unint64_t)fgDuration;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)bgEntryCount;
- (unsigned)channelSequenceAtIndex:(unint64_t)a3;
- (unsigned)channelSequences;
- (unsigned)dfspState;
- (unsigned)infraDisconnectedCount;
- (void)addChannelSequence:(unsigned int)a3;
- (void)clearChannelSequences;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setBgDuration:(unint64_t)a3;
- (void)setBgEntryCount:(unsigned int)a3;
- (void)setChannelSequences:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setDfspState:(unsigned int)a3;
- (void)setFgDuration:(unint64_t)a3;
- (void)setHasBgDuration:(BOOL)a3;
- (void)setHasBgEntryCount:(BOOL)a3;
- (void)setHasDfspState:(BOOL)a3;
- (void)setHasFgDuration:(BOOL)a3;
- (void)setHasInfraDisconnectedCount:(BOOL)a3;
- (void)setHasIsSDB:(BOOL)a3;
- (void)setHasPeerRssi24G:(BOOL)a3;
- (void)setHasPeerRssi5G:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setInfraDisconnectedCount:(unsigned int)a3;
- (void)setIsSDB:(BOOL)a3;
- (void)setPeerRssi24G:(int)a3;
- (void)setPeerRssi5G:(int)a3;
- (void)setSidecarBssSteering:(id)a3;
- (void)setSidecarPeerTraffic:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDWiFiAwdlSidecar

- (void)dealloc
{
  [(AWDWiFiAwdlSidecar *)self setSidecarBssSteering:0];
  [(AWDWiFiAwdlSidecar *)self setSidecarPeerTraffic:0];
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiAwdlSidecar;
  [(AWDWiFiAwdlSidecar *)&v3 dealloc];
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setFgDuration:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_fgDuration = a3;
}

- (void)setHasFgDuration:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasFgDuration
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setBgDuration:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_bgDuration = a3;
}

- (void)setHasBgDuration:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasBgDuration
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setBgEntryCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_bgEntryCount = a3;
}

- (void)setHasBgEntryCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasBgEntryCount
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setPeerRssi24G:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_peerRssi24G = a3;
}

- (void)setHasPeerRssi24G:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasPeerRssi24G
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setPeerRssi5G:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_peerRssi5G = a3;
}

- (void)setHasPeerRssi5G:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasPeerRssi5G
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setIsSDB:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_isSDB = a3;
}

- (void)setHasIsSDB:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasIsSDB
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (BOOL)hasSidecarBssSteering
{
  return self->_sidecarBssSteering != 0;
}

- (BOOL)hasSidecarPeerTraffic
{
  return self->_sidecarPeerTraffic != 0;
}

- (void)setDfspState:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_dfspState = a3;
}

- (void)setHasDfspState:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasDfspState
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setInfraDisconnectedCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_infraDisconnectedCount = a3;
}

- (void)setHasInfraDisconnectedCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasInfraDisconnectedCount
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (unint64_t)channelSequencesCount
{
  return self->_channelSequences.count;
}

- (unsigned)channelSequences
{
  return self->_channelSequences.list;
}

- (void)clearChannelSequences
{
}

- (void)addChannelSequence:(unsigned int)a3
{
}

- (unsigned)channelSequenceAtIndex:(unint64_t)a3
{
  p_channelSequences = &self->_channelSequences;
  unint64_t count = self->_channelSequences.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count], "raise" reason userInfo];
  }
  return p_channelSequences->list[a3];
}

- (void)setChannelSequences:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiAwdlSidecar;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWiFiAwdlSidecar description](&v3, sel_description), -[AWDWiFiAwdlSidecar dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  __int16 has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_20;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_fgDuration] forKey:@"fgDuration"];
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_21;
  }
LABEL_20:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_bgDuration] forKey:@"bgDuration"];
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0) {
      goto LABEL_6;
    }
    goto LABEL_22;
  }
LABEL_21:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_bgEntryCount] forKey:@"bgEntryCount"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 0x80) == 0) {
      goto LABEL_7;
    }
    goto LABEL_23;
  }
LABEL_22:
  [v3 setObject:[NSNumber numberWithInt:self->_peerRssi24G] forKey:@"peerRssi24G"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_7:
    if ((has & 0x100) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_23:
  [v3 setObject:[NSNumber numberWithInt:self->_peerRssi5G] forKey:@"peerRssi5G"];
  if ((*(_WORD *)&self->_has & 0x100) != 0) {
LABEL_8:
  }
    [v3 setObject:[NSNumber numberWithBool:self->_isSDB] forKey:@"isSDB"];
LABEL_9:
  sidecarBssSteering = self->_sidecarBssSteering;
  if (sidecarBssSteering) {
    [v3 setObject:-[AWDSidecarBssSteering dictionaryRepresentation](sidecarBssSteering, "dictionaryRepresentation") forKey:@"sidecarBssSteering"];
  }
  sidecarPeerTraffic = self->_sidecarPeerTraffic;
  if (sidecarPeerTraffic) {
    [v3 setObject:[[sidecarPeerTraffic dictionaryRepresentation] forKey:@"sidecarPeerTraffic"];
  }
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x10) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_dfspState] forKey:@"dfspState"];
    __int16 v7 = (__int16)self->_has;
  }
  if ((v7 & 0x20) != 0) {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_infraDisconnectedCount] forKey:@"infraDisconnectedCount"];
  }
  [v3 setObject:PBRepeatedUInt32NSArray() forKey:@"channelSequence"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiAwdlSidecarReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint64Field();
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_23;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0) {
      goto LABEL_6;
    }
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 0x80) == 0) {
      goto LABEL_7;
    }
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_7:
    if ((has & 0x100) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_26:
  PBDataWriterWriteInt32Field();
  if ((*(_WORD *)&self->_has & 0x100) != 0) {
LABEL_8:
  }
    PBDataWriterWriteBOOLField();
LABEL_9:
  if (self->_sidecarBssSteering) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_sidecarPeerTraffic) {
    PBDataWriterWriteSubmessage();
  }
  __int16 v5 = (__int16)self->_has;
  if ((v5 & 0x10) != 0)
  {
    PBDataWriterWriteUint32Field();
    __int16 v5 = (__int16)self->_has;
  }
  if ((v5 & 0x20) != 0) {
    PBDataWriterWriteUint32Field();
  }
  p_channelSequences = &self->_channelSequences;
  if (p_channelSequences->count)
  {
    unint64_t v7 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v7;
    }
    while (v7 < p_channelSequences->count);
  }
}

- (void)copyTo:(id)a3
{
  __int16 has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    *((void *)a3 + 6) = self->_timestamp;
    *((_WORD *)a3 + 50) |= 4u;
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_24;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((void *)a3 + 5) = self->_fgDuration;
  *((_WORD *)a3 + 50) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((void *)a3 + 4) = self->_bgDuration;
  *((_WORD *)a3 + 50) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0) {
      goto LABEL_6;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)a3 + 14) = self->_bgEntryCount;
  *((_WORD *)a3 + 50) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 0x80) == 0) {
      goto LABEL_7;
    }
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)a3 + 17) = self->_peerRssi24G;
  *((_WORD *)a3 + 50) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_7:
    if ((has & 0x100) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_27:
  *((_DWORD *)a3 + 18) = self->_peerRssi5G;
  *((_WORD *)a3 + 50) |= 0x80u;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_8:
    *((unsigned char *)a3 + 96) = self->_isSDB;
    *((_WORD *)a3 + 50) |= 0x100u;
  }
LABEL_9:
  if (self->_sidecarBssSteering) {
    [a3 setSidecarBssSteering:];
  }
  if (self->_sidecarPeerTraffic) {
    [a3 setSidecarPeerTraffic:];
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x10) != 0)
  {
    *((_DWORD *)a3 + 15) = self->_dfspState;
    *((_WORD *)a3 + 50) |= 0x10u;
    __int16 v6 = (__int16)self->_has;
  }
  if ((v6 & 0x20) != 0)
  {
    *((_DWORD *)a3 + 16) = self->_infraDisconnectedCount;
    *((_WORD *)a3 + 50) |= 0x20u;
  }
  if ([(AWDWiFiAwdlSidecar *)self channelSequencesCount])
  {
    [a3 clearChannelSequences];
    unint64_t v7 = [(AWDWiFiAwdlSidecar *)self channelSequencesCount];
    if (v7)
    {
      unint64_t v8 = v7;
      for (uint64_t i = 0; i != v8; ++i)
        [a3 addChannelSequence:-[AWDWiFiAwdlSidecar channelSequenceAtIndex:](self, "channelSequenceAtIndex:", i)];
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [(id)[(id)objc_opt_class() allocWithZone:a3] init];
  uint64_t v6 = v5;
  __int16 has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    *(void *)(v5 + 48) = self->_timestamp;
    *(_WORD *)(v5 + 100) |= 4u;
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(void *)(v5 + 40) = self->_fgDuration;
  *(_WORD *)(v5 + 100) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  *(void *)(v5 + 32) = self->_bgDuration;
  *(_WORD *)(v5 + 100) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  *(_DWORD *)(v5 + 56) = self->_bgEntryCount;
  *(_WORD *)(v5 + 100) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 0x80) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  *(_DWORD *)(v5 + 68) = self->_peerRssi24G;
  *(_WORD *)(v5 + 100) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_7:
    if ((has & 0x100) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_19:
  *(_DWORD *)(v5 + 72) = self->_peerRssi5G;
  *(_WORD *)(v5 + 100) |= 0x80u;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_8:
    *(unsigned char *)(v5 + 96) = self->_isSDB;
    *(_WORD *)(v5 + 100) |= 0x100u;
  }
LABEL_9:

  *(void *)(v6 + 80) = [(AWDSidecarBssSteering *)self->_sidecarBssSteering copyWithZone:a3];
  *(void *)(v6 + 88) = [(AWDSidecarPeerTraffic *)self->_sidecarPeerTraffic copyWithZone:a3];
  __int16 v8 = (__int16)self->_has;
  if ((v8 & 0x10) != 0)
  {
    *(_DWORD *)(v6 + 60) = self->_dfspState;
    *(_WORD *)(v6 + 100) |= 0x10u;
    __int16 v8 = (__int16)self->_has;
  }
  if ((v8 & 0x20) != 0)
  {
    *(_DWORD *)(v6 + 64) = self->_infraDisconnectedCount;
    *(_WORD *)(v6 + 100) |= 0x20u;
  }
  PBRepeatedUInt32Copy();
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  if (![a3 isMemberOfClass:objc_opt_class()]) {
    return 0;
  }
  __int16 has = (__int16)self->_has;
  __int16 v6 = *((_WORD *)a3 + 50);
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_timestamp != *((void *)a3 + 6)) {
      return 0;
    }
  }
  else if ((v6 & 4) != 0)
  {
    return 0;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_fgDuration != *((void *)a3 + 5)) {
      return 0;
    }
  }
  else if ((v6 & 2) != 0)
  {
    return 0;
  }
  if (has)
  {
    if ((v6 & 1) == 0 || self->_bgDuration != *((void *)a3 + 4)) {
      return 0;
    }
  }
  else if (v6)
  {
    return 0;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_bgEntryCount != *((_DWORD *)a3 + 14)) {
      return 0;
    }
  }
  else if ((v6 & 8) != 0)
  {
    return 0;
  }
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_peerRssi24G != *((_DWORD *)a3 + 17)) {
      return 0;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    return 0;
  }
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_peerRssi5G != *((_DWORD *)a3 + 18)) {
      return 0;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    return 0;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)a3 + 50) & 0x100) != 0)
    {
      if (self->_isSDB)
      {
        if (!*((unsigned char *)a3 + 96)) {
          return 0;
        }
        goto LABEL_40;
      }
      if (!*((unsigned char *)a3 + 96)) {
        goto LABEL_40;
      }
    }
    return 0;
  }
  if ((*((_WORD *)a3 + 50) & 0x100) != 0) {
    return 0;
  }
LABEL_40:
  sidecarBssSteering = self->_sidecarBssSteering;
  if ((unint64_t)sidecarBssSteering | *((void *)a3 + 10)
    && !-[AWDSidecarBssSteering isEqual:](sidecarBssSteering, "isEqual:"))
  {
    return 0;
  }
  sidecarPeerTraffic = self->_sidecarPeerTraffic;
  if ((unint64_t)sidecarPeerTraffic | *((void *)a3 + 11))
  {
    if (!-[AWDSidecarPeerTraffic isEqual:](sidecarPeerTraffic, "isEqual:")) {
      return 0;
    }
  }
  __int16 v9 = (__int16)self->_has;
  __int16 v10 = *((_WORD *)a3 + 50);
  if ((v9 & 0x10) != 0)
  {
    if ((v10 & 0x10) == 0 || self->_dfspState != *((_DWORD *)a3 + 15)) {
      return 0;
    }
  }
  else if ((v10 & 0x10) != 0)
  {
    return 0;
  }
  if ((v9 & 0x20) != 0)
  {
    if ((v10 & 0x20) == 0 || self->_infraDisconnectedCount != *((_DWORD *)a3 + 16)) {
      return 0;
    }
  }
  else if ((v10 & 0x20) != 0)
  {
    return 0;
  }

  return PBRepeatedUInt32IsEqual();
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    unint64_t v16 = 2654435761u * self->_timestamp;
    if ((has & 2) != 0)
    {
LABEL_3:
      unint64_t v4 = 2654435761u * self->_fgDuration;
      if (has) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else
  {
    unint64_t v16 = 0;
    if ((has & 2) != 0) {
      goto LABEL_3;
    }
  }
  unint64_t v4 = 0;
  if (has)
  {
LABEL_4:
    unint64_t v5 = 2654435761u * self->_bgDuration;
    if ((has & 8) != 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  unint64_t v5 = 0;
  if ((has & 8) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_bgEntryCount;
    if ((has & 0x40) != 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  uint64_t v6 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_6:
    uint64_t v7 = 2654435761 * self->_peerRssi24G;
    if ((has & 0x80) != 0) {
      goto LABEL_7;
    }
LABEL_14:
    uint64_t v8 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_8;
    }
    goto LABEL_15;
  }
LABEL_13:
  uint64_t v7 = 0;
  if ((has & 0x80) == 0) {
    goto LABEL_14;
  }
LABEL_7:
  uint64_t v8 = 2654435761 * self->_peerRssi5G;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_8:
    uint64_t v9 = 2654435761 * self->_isSDB;
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v9 = 0;
LABEL_16:
  unint64_t v10 = [(AWDSidecarBssSteering *)self->_sidecarBssSteering hash];
  unint64_t v11 = [(AWDSidecarPeerTraffic *)self->_sidecarPeerTraffic hash];
  __int16 v12 = (__int16)self->_has;
  if ((v12 & 0x10) != 0)
  {
    uint64_t v13 = 2654435761 * self->_dfspState;
    if ((v12 & 0x20) != 0) {
      goto LABEL_18;
    }
LABEL_20:
    uint64_t v14 = 0;
    return v4 ^ v16 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14 ^ PBRepeatedUInt32Hash();
  }
  uint64_t v13 = 0;
  if ((v12 & 0x20) == 0) {
    goto LABEL_20;
  }
LABEL_18:
  uint64_t v14 = 2654435761 * self->_infraDisconnectedCount;
  return v4 ^ v16 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14 ^ PBRepeatedUInt32Hash();
}

- (void)mergeFrom:(id)a3
{
  __int16 v5 = *((_WORD *)a3 + 50);
  if ((v5 & 4) != 0)
  {
    self->_timestamp = *((void *)a3 + 6);
    *(_WORD *)&self->_has |= 4u;
    __int16 v5 = *((_WORD *)a3 + 50);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((v5 & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_fgDuration = *((void *)a3 + 5);
  *(_WORD *)&self->_has |= 2u;
  __int16 v5 = *((_WORD *)a3 + 50);
  if ((v5 & 1) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  self->_bgDuration = *((void *)a3 + 4);
  *(_WORD *)&self->_has |= 1u;
  __int16 v5 = *((_WORD *)a3 + 50);
  if ((v5 & 8) == 0)
  {
LABEL_5:
    if ((v5 & 0x40) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  self->_bgEntryCount = *((_DWORD *)a3 + 14);
  *(_WORD *)&self->_has |= 8u;
  __int16 v5 = *((_WORD *)a3 + 50);
  if ((v5 & 0x40) == 0)
  {
LABEL_6:
    if ((v5 & 0x80) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  self->_peerRssi24G = *((_DWORD *)a3 + 17);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v5 = *((_WORD *)a3 + 50);
  if ((v5 & 0x80) == 0)
  {
LABEL_7:
    if ((v5 & 0x100) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_17:
  self->_peerRssi5G = *((_DWORD *)a3 + 18);
  *(_WORD *)&self->_has |= 0x80u;
  if ((*((_WORD *)a3 + 50) & 0x100) != 0)
  {
LABEL_8:
    self->_isSDB = *((unsigned char *)a3 + 96);
    *(_WORD *)&self->_has |= 0x100u;
  }
LABEL_9:
  sidecarBssSteering = self->_sidecarBssSteering;
  uint64_t v7 = *((void *)a3 + 10);
  if (sidecarBssSteering)
  {
    if (v7) {
      -[AWDSidecarBssSteering mergeFrom:](sidecarBssSteering, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[AWDWiFiAwdlSidecar setSidecarBssSteering:](self, "setSidecarBssSteering:");
  }
  sidecarPeerTraffic = self->_sidecarPeerTraffic;
  uint64_t v9 = *((void *)a3 + 11);
  if (sidecarPeerTraffic)
  {
    if (v9) {
      -[AWDSidecarPeerTraffic mergeFrom:](sidecarPeerTraffic, "mergeFrom:");
    }
  }
  else if (v9)
  {
    -[AWDWiFiAwdlSidecar setSidecarPeerTraffic:](self, "setSidecarPeerTraffic:");
  }
  __int16 v10 = *((_WORD *)a3 + 50);
  if ((v10 & 0x10) != 0)
  {
    self->_dfspState = *((_DWORD *)a3 + 15);
    *(_WORD *)&self->_has |= 0x10u;
    __int16 v10 = *((_WORD *)a3 + 50);
  }
  if ((v10 & 0x20) != 0)
  {
    self->_infraDisconnectedCount = *((_DWORD *)a3 + 16);
    *(_WORD *)&self->_has |= 0x20u;
  }
  uint64_t v11 = [a3 channelSequencesCount];
  if (v11)
  {
    uint64_t v12 = v11;
    for (uint64_t i = 0; i != v12; ++i)
      -[AWDWiFiAwdlSidecar addChannelSequence:](self, "addChannelSequence:", [a3 channelSequenceAtIndex:i]);
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unint64_t)fgDuration
{
  return self->_fgDuration;
}

- (unint64_t)bgDuration
{
  return self->_bgDuration;
}

- (unsigned)bgEntryCount
{
  return self->_bgEntryCount;
}

- (int)peerRssi24G
{
  return self->_peerRssi24G;
}

- (int)peerRssi5G
{
  return self->_peerRssi5G;
}

- (BOOL)isSDB
{
  return self->_isSDB;
}

- (AWDSidecarBssSteering)sidecarBssSteering
{
  return self->_sidecarBssSteering;
}

- (void)setSidecarBssSteering:(id)a3
{
}

- (AWDSidecarPeerTraffic)sidecarPeerTraffic
{
  return self->_sidecarPeerTraffic;
}

- (void)setSidecarPeerTraffic:(id)a3
{
}

- (unsigned)dfspState
{
  return self->_dfspState;
}

- (unsigned)infraDisconnectedCount
{
  return self->_infraDisconnectedCount;
}

@end