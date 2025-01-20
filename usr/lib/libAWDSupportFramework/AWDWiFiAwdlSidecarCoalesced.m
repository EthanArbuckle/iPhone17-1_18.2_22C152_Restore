@interface AWDWiFiAwdlSidecarCoalesced
- (AWDSidecarBssSteering)remoteSidecarBssSteering;
- (AWDSidecarBssSteering)selfSidecarBssSteering;
- (AWDSidecarPeerTraffic)remoteSidecarPeerTraffic;
- (AWDSidecarPeerTraffic)selfSidecarPeerTraffic;
- (BOOL)hasPencilOffCount;
- (BOOL)hasPencilOnCount;
- (BOOL)hasRemoteBgDuration;
- (BOOL)hasRemoteBgEntryCount;
- (BOOL)hasRemoteFgDuration;
- (BOOL)hasRemotePeerRssi24G;
- (BOOL)hasRemotePeerRssi5G;
- (BOOL)hasRemoteSidecarBssSteering;
- (BOOL)hasRemoteSidecarPeerTraffic;
- (BOOL)hasRemotefIsSDB;
- (BOOL)hasSelfBgDuration;
- (BOOL)hasSelfBgEntryCount;
- (BOOL)hasSelfFgDuration;
- (BOOL)hasSelfIsSDB;
- (BOOL)hasSelfPeerRssi24G;
- (BOOL)hasSelfPeerRssi5G;
- (BOOL)hasSelfSidecarBssSteering;
- (BOOL)hasSelfSidecarPeerTraffic;
- (BOOL)hasSessionUUID;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)remotefIsSDB;
- (BOOL)selfIsSDB;
- (NSString)sessionUUID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)remotePeerRssi24G;
- (int)remotePeerRssi5G;
- (int)selfPeerRssi24G;
- (int)selfPeerRssi5G;
- (unint64_t)hash;
- (unint64_t)remoteBgDuration;
- (unint64_t)remoteFgDuration;
- (unint64_t)selfBgDuration;
- (unint64_t)selfFgDuration;
- (unint64_t)timestamp;
- (unsigned)pencilOffCount;
- (unsigned)pencilOnCount;
- (unsigned)remoteBgEntryCount;
- (unsigned)selfBgEntryCount;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setHasPencilOffCount:(BOOL)a3;
- (void)setHasPencilOnCount:(BOOL)a3;
- (void)setHasRemoteBgDuration:(BOOL)a3;
- (void)setHasRemoteBgEntryCount:(BOOL)a3;
- (void)setHasRemoteFgDuration:(BOOL)a3;
- (void)setHasRemotePeerRssi24G:(BOOL)a3;
- (void)setHasRemotePeerRssi5G:(BOOL)a3;
- (void)setHasRemotefIsSDB:(BOOL)a3;
- (void)setHasSelfBgDuration:(BOOL)a3;
- (void)setHasSelfBgEntryCount:(BOOL)a3;
- (void)setHasSelfFgDuration:(BOOL)a3;
- (void)setHasSelfIsSDB:(BOOL)a3;
- (void)setHasSelfPeerRssi24G:(BOOL)a3;
- (void)setHasSelfPeerRssi5G:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setPencilOffCount:(unsigned int)a3;
- (void)setPencilOnCount:(unsigned int)a3;
- (void)setRemoteBgDuration:(unint64_t)a3;
- (void)setRemoteBgEntryCount:(unsigned int)a3;
- (void)setRemoteFgDuration:(unint64_t)a3;
- (void)setRemotePeerRssi24G:(int)a3;
- (void)setRemotePeerRssi5G:(int)a3;
- (void)setRemoteSidecarBssSteering:(id)a3;
- (void)setRemoteSidecarPeerTraffic:(id)a3;
- (void)setRemotefIsSDB:(BOOL)a3;
- (void)setSelfBgDuration:(unint64_t)a3;
- (void)setSelfBgEntryCount:(unsigned int)a3;
- (void)setSelfFgDuration:(unint64_t)a3;
- (void)setSelfIsSDB:(BOOL)a3;
- (void)setSelfPeerRssi24G:(int)a3;
- (void)setSelfPeerRssi5G:(int)a3;
- (void)setSelfSidecarBssSteering:(id)a3;
- (void)setSelfSidecarPeerTraffic:(id)a3;
- (void)setSessionUUID:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDWiFiAwdlSidecarCoalesced

- (void)dealloc
{
  [(AWDWiFiAwdlSidecarCoalesced *)self setSelfSidecarBssSteering:0];
  [(AWDWiFiAwdlSidecarCoalesced *)self setRemoteSidecarBssSteering:0];
  [(AWDWiFiAwdlSidecarCoalesced *)self setSelfSidecarPeerTraffic:0];
  [(AWDWiFiAwdlSidecarCoalesced *)self setRemoteSidecarPeerTraffic:0];
  [(AWDWiFiAwdlSidecarCoalesced *)self setSessionUUID:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiAwdlSidecarCoalesced;
  [(AWDWiFiAwdlSidecarCoalesced *)&v3 dealloc];
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setSelfFgDuration:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_selfFgDuration = a3;
}

- (void)setHasSelfFgDuration:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasSelfFgDuration
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setSelfBgDuration:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_selfBgDuration = a3;
}

- (void)setHasSelfBgDuration:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasSelfBgDuration
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setSelfBgEntryCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_selfBgEntryCount = a3;
}

- (void)setHasSelfBgEntryCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasSelfBgEntryCount
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setSelfPeerRssi24G:(int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_selfPeerRssi24G = a3;
}

- (void)setHasSelfPeerRssi24G:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasSelfPeerRssi24G
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setSelfPeerRssi5G:(int)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_selfPeerRssi5G = a3;
}

- (void)setHasSelfPeerRssi5G:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasSelfPeerRssi5G
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setSelfIsSDB:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x4000u;
  self->_selfIsSDB = a3;
}

- (void)setHasSelfIsSDB:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x4000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xBFFF | v3;
}

- (BOOL)hasSelfIsSDB
{
  return (*(_WORD *)&self->_has >> 14) & 1;
}

- (void)setRemoteFgDuration:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_remoteFgDuration = a3;
}

- (void)setHasRemoteFgDuration:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasRemoteFgDuration
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setRemoteBgDuration:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_remoteBgDuration = a3;
}

- (void)setHasRemoteBgDuration:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasRemoteBgDuration
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setRemoteBgEntryCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_remoteBgEntryCount = a3;
}

- (void)setHasRemoteBgEntryCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasRemoteBgEntryCount
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setRemotePeerRssi24G:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_remotePeerRssi24G = a3;
}

- (void)setHasRemotePeerRssi24G:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasRemotePeerRssi24G
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setRemotePeerRssi5G:(int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_remotePeerRssi5G = a3;
}

- (void)setHasRemotePeerRssi5G:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasRemotePeerRssi5G
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setRemotefIsSDB:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_remotefIsSDB = a3;
}

- (void)setHasRemotefIsSDB:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x2000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasRemotefIsSDB
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (BOOL)hasSelfSidecarBssSteering
{
  return self->_selfSidecarBssSteering != 0;
}

- (BOOL)hasRemoteSidecarBssSteering
{
  return self->_remoteSidecarBssSteering != 0;
}

- (BOOL)hasSelfSidecarPeerTraffic
{
  return self->_selfSidecarPeerTraffic != 0;
}

- (BOOL)hasRemoteSidecarPeerTraffic
{
  return self->_remoteSidecarPeerTraffic != 0;
}

- (void)setPencilOnCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_pencilOnCount = a3;
}

- (void)setHasPencilOnCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasPencilOnCount
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setPencilOffCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_pencilOffCount = a3;
}

- (void)setHasPencilOffCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasPencilOffCount
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (BOOL)hasSessionUUID
{
  return self->_sessionUUID != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiAwdlSidecarCoalesced;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWiFiAwdlSidecarCoalesced description](&v3, sel_description), -[AWDWiFiAwdlSidecarCoalesced dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_32;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_selfFgDuration] forKey:@"selfFgDuration"];
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x400) == 0) {
      goto LABEL_5;
    }
    goto LABEL_33;
  }
LABEL_32:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_selfBgDuration] forKey:@"selfBgDuration"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_5:
    if ((has & 0x800) == 0) {
      goto LABEL_6;
    }
    goto LABEL_34;
  }
LABEL_33:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_selfBgEntryCount] forKey:@"selfBgEntryCount"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_6:
    if ((has & 0x1000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_35;
  }
LABEL_34:
  [v3 setObject:[NSNumber numberWithInt:self->_selfPeerRssi24G] forKey:@"selfPeerRssi24G"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_7:
    if ((has & 0x4000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_36;
  }
LABEL_35:
  [v3 setObject:[NSNumber numberWithInt:self->_selfPeerRssi5G] forKey:@"selfPeerRssi5G"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_8:
    if ((has & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_37;
  }
LABEL_36:
  [v3 setObject:[NSNumber numberWithBool:self->_selfIsSDB] forKey:@"selfIsSDB"];
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_9:
    if ((has & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_38;
  }
LABEL_37:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_remoteFgDuration] forKey:@"remoteFgDuration"];
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_10:
    if ((has & 0x80) == 0) {
      goto LABEL_11;
    }
    goto LABEL_39;
  }
LABEL_38:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_remoteBgDuration] forKey:@"remoteBgDuration"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_11:
    if ((has & 0x100) == 0) {
      goto LABEL_12;
    }
    goto LABEL_40;
  }
LABEL_39:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_remoteBgEntryCount] forKey:@"remoteBgEntryCount"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_12:
    if ((has & 0x200) == 0) {
      goto LABEL_13;
    }
    goto LABEL_41;
  }
LABEL_40:
  [v3 setObject:[NSNumber numberWithInt:self->_remotePeerRssi24G] forKey:@"remotePeerRssi24G"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_13:
    if ((has & 0x2000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_41:
  [v3 setObject:[NSNumber numberWithInt:self->_remotePeerRssi5G] forKey:@"remotePeerRssi5G"];
  if ((*(_WORD *)&self->_has & 0x2000) != 0) {
LABEL_14:
  }
    [v3 setObject:[NSNumber numberWithBool:self->_remotefIsSDB] forKey:@"remotefIsSDB"];
LABEL_15:
  selfSidecarBssSteering = self->_selfSidecarBssSteering;
  if (selfSidecarBssSteering) {
    [v3 setObject:-[AWDSidecarBssSteering dictionaryRepresentation](selfSidecarBssSteering, "dictionaryRepresentation") forKey:@"selfSidecarBssSteering"];
  }
  remoteSidecarBssSteering = self->_remoteSidecarBssSteering;
  if (remoteSidecarBssSteering) {
    [v3 setObject:-[AWDSidecarBssSteering dictionaryRepresentation](remoteSidecarBssSteering, "dictionaryRepresentation") forKey:@"remoteSidecarBssSteering"];
  }
  selfSidecarPeerTraffic = self->_selfSidecarPeerTraffic;
  if (selfSidecarPeerTraffic) {
    [v3 setObject:-[AWDSidecarPeerTraffic dictionaryRepresentation](selfSidecarPeerTraffic, "dictionaryRepresentation") forKey:@"selfSidecarPeerTraffic"];
  }
  remoteSidecarPeerTraffic = self->_remoteSidecarPeerTraffic;
  if (remoteSidecarPeerTraffic) {
    [v3 setObject:[[-[AWDSidecarPeerTraffic dictionaryRepresentation](remoteSidecarPeerTraffic, "dictionaryRepresentation") dictionaryRepresentation] forKey:@"remoteSidecarPeerTraffic"];
  }
  __int16 v9 = (__int16)self->_has;
  if ((v9 & 0x40) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_pencilOnCount] forKey:@"pencilOnCount"];
    __int16 v9 = (__int16)self->_has;
  }
  if ((v9 & 0x20) != 0) {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_pencilOffCount] forKey:@"pencilOffCount"];
  }
  sessionUUID = self->_sessionUUID;
  if (sessionUUID) {
    [v3 setObject:sessionUUID forKey:@"sessionUUID"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiAwdlSidecarCoalescedReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteUint64Field();
    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_33;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x400) == 0) {
      goto LABEL_5;
    }
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_5:
    if ((has & 0x800) == 0) {
      goto LABEL_6;
    }
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_6:
    if ((has & 0x1000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_7:
    if ((has & 0x4000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_8:
    if ((has & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_9:
    if ((has & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_10:
    if ((has & 0x80) == 0) {
      goto LABEL_11;
    }
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_11:
    if ((has & 0x100) == 0) {
      goto LABEL_12;
    }
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_12:
    if ((has & 0x200) == 0) {
      goto LABEL_13;
    }
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_13:
    if ((has & 0x2000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_42:
  PBDataWriterWriteInt32Field();
  if ((*(_WORD *)&self->_has & 0x2000) != 0) {
LABEL_14:
  }
    PBDataWriterWriteBOOLField();
LABEL_15:
  if (self->_selfSidecarBssSteering) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_remoteSidecarBssSteering) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_selfSidecarPeerTraffic) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_remoteSidecarPeerTraffic) {
    PBDataWriterWriteSubmessage();
  }
  __int16 v5 = (__int16)self->_has;
  if ((v5 & 0x40) != 0)
  {
    PBDataWriterWriteUint32Field();
    __int16 v5 = (__int16)self->_has;
  }
  if ((v5 & 0x20) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_sessionUUID)
  {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    *((void *)a3 + 5) = self->_timestamp;
    *((_WORD *)a3 + 66) |= 0x10u;
    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_33;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((void *)a3 + 4) = self->_selfFgDuration;
  *((_WORD *)a3 + 66) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x400) == 0) {
      goto LABEL_5;
    }
    goto LABEL_34;
  }
LABEL_33:
  *((void *)a3 + 3) = self->_selfBgDuration;
  *((_WORD *)a3 + 66) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_5:
    if ((has & 0x800) == 0) {
      goto LABEL_6;
    }
    goto LABEL_35;
  }
LABEL_34:
  *((_DWORD *)a3 + 22) = self->_selfBgEntryCount;
  *((_WORD *)a3 + 66) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_6:
    if ((has & 0x1000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_36;
  }
LABEL_35:
  *((_DWORD *)a3 + 23) = self->_selfPeerRssi24G;
  *((_WORD *)a3 + 66) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_7:
    if ((has & 0x4000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_37;
  }
LABEL_36:
  *((_DWORD *)a3 + 24) = self->_selfPeerRssi5G;
  *((_WORD *)a3 + 66) |= 0x1000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_8:
    if ((has & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_38;
  }
LABEL_37:
  *((unsigned char *)a3 + 129) = self->_selfIsSDB;
  *((_WORD *)a3 + 66) |= 0x4000u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_9:
    if ((has & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_39;
  }
LABEL_38:
  *((void *)a3 + 2) = self->_remoteFgDuration;
  *((_WORD *)a3 + 66) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_10:
    if ((has & 0x80) == 0) {
      goto LABEL_11;
    }
    goto LABEL_40;
  }
LABEL_39:
  *((void *)a3 + 1) = self->_remoteBgDuration;
  *((_WORD *)a3 + 66) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_11:
    if ((has & 0x100) == 0) {
      goto LABEL_12;
    }
    goto LABEL_41;
  }
LABEL_40:
  *((_DWORD *)a3 + 14) = self->_remoteBgEntryCount;
  *((_WORD *)a3 + 66) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_12:
    if ((has & 0x200) == 0) {
      goto LABEL_13;
    }
    goto LABEL_42;
  }
LABEL_41:
  *((_DWORD *)a3 + 15) = self->_remotePeerRssi24G;
  *((_WORD *)a3 + 66) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_13:
    if ((has & 0x2000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_42:
  *((_DWORD *)a3 + 16) = self->_remotePeerRssi5G;
  *((_WORD *)a3 + 66) |= 0x200u;
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
LABEL_14:
    *((unsigned char *)a3 + 128) = self->_remotefIsSDB;
    *((_WORD *)a3 + 66) |= 0x2000u;
  }
LABEL_15:
  if (self->_selfSidecarBssSteering) {
    [a3 setSelfSidecarBssSteering:];
  }
  if (self->_remoteSidecarBssSteering) {
    [a3 setRemoteSidecarBssSteering:];
  }
  if (self->_selfSidecarPeerTraffic) {
    [a3 setSelfSidecarPeerTraffic:];
  }
  if (self->_remoteSidecarPeerTraffic) {
    [a3 setRemoteSidecarPeerTraffic:];
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x40) != 0)
  {
    *((_DWORD *)a3 + 13) = self->_pencilOnCount;
    *((_WORD *)a3 + 66) |= 0x40u;
    __int16 v6 = (__int16)self->_has;
  }
  if ((v6 & 0x20) != 0)
  {
    *((_DWORD *)a3 + 12) = self->_pencilOffCount;
    *((_WORD *)a3 + 66) |= 0x20u;
  }
  if (self->_sessionUUID)
  {
    [a3 setSessionUUID:];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [(id)[(id)objc_opt_class() allocWithZone:a3] init];
  uint64_t v6 = v5;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    *(void *)(v5 + 40) = self->_timestamp;
    *(_WORD *)(v5 + 132) |= 0x10u;
    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_22;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  *(void *)(v5 + 32) = self->_selfFgDuration;
  *(_WORD *)(v5 + 132) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x400) == 0) {
      goto LABEL_5;
    }
    goto LABEL_23;
  }
LABEL_22:
  *(void *)(v5 + 24) = self->_selfBgDuration;
  *(_WORD *)(v5 + 132) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_5:
    if ((has & 0x800) == 0) {
      goto LABEL_6;
    }
    goto LABEL_24;
  }
LABEL_23:
  *(_DWORD *)(v5 + 88) = self->_selfBgEntryCount;
  *(_WORD *)(v5 + 132) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_6:
    if ((has & 0x1000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_25;
  }
LABEL_24:
  *(_DWORD *)(v5 + 92) = self->_selfPeerRssi24G;
  *(_WORD *)(v5 + 132) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_7:
    if ((has & 0x4000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_26;
  }
LABEL_25:
  *(_DWORD *)(v5 + 96) = self->_selfPeerRssi5G;
  *(_WORD *)(v5 + 132) |= 0x1000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_8:
    if ((has & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_27;
  }
LABEL_26:
  *(unsigned char *)(v5 + 129) = self->_selfIsSDB;
  *(_WORD *)(v5 + 132) |= 0x4000u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_9:
    if ((has & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_28;
  }
LABEL_27:
  *(void *)(v5 + 16) = self->_remoteFgDuration;
  *(_WORD *)(v5 + 132) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_10:
    if ((has & 0x80) == 0) {
      goto LABEL_11;
    }
    goto LABEL_29;
  }
LABEL_28:
  *(void *)(v5 + 8) = self->_remoteBgDuration;
  *(_WORD *)(v5 + 132) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_11:
    if ((has & 0x100) == 0) {
      goto LABEL_12;
    }
    goto LABEL_30;
  }
LABEL_29:
  *(_DWORD *)(v5 + 56) = self->_remoteBgEntryCount;
  *(_WORD *)(v5 + 132) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_12:
    if ((has & 0x200) == 0) {
      goto LABEL_13;
    }
    goto LABEL_31;
  }
LABEL_30:
  *(_DWORD *)(v5 + 60) = self->_remotePeerRssi24G;
  *(_WORD *)(v5 + 132) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_13:
    if ((has & 0x2000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_31:
  *(_DWORD *)(v5 + 64) = self->_remotePeerRssi5G;
  *(_WORD *)(v5 + 132) |= 0x200u;
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
LABEL_14:
    *(unsigned char *)(v5 + 128) = self->_remotefIsSDB;
    *(_WORD *)(v5 + 132) |= 0x2000u;
  }
LABEL_15:

  *(void *)(v6 + 104) = [(AWDSidecarBssSteering *)self->_selfSidecarBssSteering copyWithZone:a3];
  *(void *)(v6 + 72) = [(AWDSidecarBssSteering *)self->_remoteSidecarBssSteering copyWithZone:a3];

  *(void *)(v6 + 112) = [(AWDSidecarPeerTraffic *)self->_selfSidecarPeerTraffic copyWithZone:a3];
  *(void *)(v6 + 80) = [(AWDSidecarPeerTraffic *)self->_remoteSidecarPeerTraffic copyWithZone:a3];
  __int16 v8 = (__int16)self->_has;
  if ((v8 & 0x40) != 0)
  {
    *(_DWORD *)(v6 + 52) = self->_pencilOnCount;
    *(_WORD *)(v6 + 132) |= 0x40u;
    __int16 v8 = (__int16)self->_has;
  }
  if ((v8 & 0x20) != 0)
  {
    *(_DWORD *)(v6 + 48) = self->_pencilOffCount;
    *(_WORD *)(v6 + 132) |= 0x20u;
  }

  *(void *)(v6 + 120) = [(NSString *)self->_sessionUUID copyWithZone:a3];
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (!v5) {
    return v5;
  }
  __int16 has = (__int16)self->_has;
  __int16 v7 = *((_WORD *)a3 + 66);
  if ((has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_timestamp != *((void *)a3 + 5)) {
      goto LABEL_69;
    }
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_69;
  }
  if ((has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_selfFgDuration != *((void *)a3 + 4)) {
      goto LABEL_69;
    }
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_69;
  }
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_selfBgDuration != *((void *)a3 + 3)) {
      goto LABEL_69;
    }
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_69;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)a3 + 66) & 0x400) == 0 || self->_selfBgEntryCount != *((_DWORD *)a3 + 22)) {
      goto LABEL_69;
    }
  }
  else if ((*((_WORD *)a3 + 66) & 0x400) != 0)
  {
    goto LABEL_69;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)a3 + 66) & 0x800) == 0 || self->_selfPeerRssi24G != *((_DWORD *)a3 + 23)) {
      goto LABEL_69;
    }
  }
  else if ((*((_WORD *)a3 + 66) & 0x800) != 0)
  {
    goto LABEL_69;
  }
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    if ((*((_WORD *)a3 + 66) & 0x1000) == 0 || self->_selfPeerRssi5G != *((_DWORD *)a3 + 24)) {
      goto LABEL_69;
    }
  }
  else if ((*((_WORD *)a3 + 66) & 0x1000) != 0)
  {
    goto LABEL_69;
  }
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
    if ((*((_WORD *)a3 + 66) & 0x4000) == 0) {
      goto LABEL_69;
    }
    if (self->_selfIsSDB)
    {
      if (!*((unsigned char *)a3 + 129)) {
        goto LABEL_69;
      }
    }
    else if (*((unsigned char *)a3 + 129))
    {
      goto LABEL_69;
    }
  }
  else if ((*((_WORD *)a3 + 66) & 0x4000) != 0)
  {
    goto LABEL_69;
  }
  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_remoteFgDuration != *((void *)a3 + 2)) {
      goto LABEL_69;
    }
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_69;
  }
  if (has)
  {
    if ((v7 & 1) == 0 || self->_remoteBgDuration != *((void *)a3 + 1)) {
      goto LABEL_69;
    }
  }
  else if (v7)
  {
    goto LABEL_69;
  }
  if ((has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_remoteBgEntryCount != *((_DWORD *)a3 + 14)) {
      goto LABEL_69;
    }
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_69;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)a3 + 66) & 0x100) == 0 || self->_remotePeerRssi24G != *((_DWORD *)a3 + 15)) {
      goto LABEL_69;
    }
  }
  else if ((*((_WORD *)a3 + 66) & 0x100) != 0)
  {
    goto LABEL_69;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)a3 + 66) & 0x200) == 0 || self->_remotePeerRssi5G != *((_DWORD *)a3 + 16)) {
      goto LABEL_69;
    }
  }
  else if ((*((_WORD *)a3 + 66) & 0x200) != 0)
  {
    goto LABEL_69;
  }
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
    if ((*((_WORD *)a3 + 66) & 0x2000) == 0) {
      goto LABEL_69;
    }
    if (self->_remotefIsSDB)
    {
      if (!*((unsigned char *)a3 + 128)) {
        goto LABEL_69;
      }
    }
    else if (*((unsigned char *)a3 + 128))
    {
      goto LABEL_69;
    }
  }
  else if ((*((_WORD *)a3 + 66) & 0x2000) != 0)
  {
    goto LABEL_69;
  }
  selfSidecarBssSteering = self->_selfSidecarBssSteering;
  if ((unint64_t)selfSidecarBssSteering | *((void *)a3 + 13))
  {
    int v5 = -[AWDSidecarBssSteering isEqual:](selfSidecarBssSteering, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  remoteSidecarBssSteering = self->_remoteSidecarBssSteering;
  if ((unint64_t)remoteSidecarBssSteering | *((void *)a3 + 9))
  {
    int v5 = -[AWDSidecarBssSteering isEqual:](remoteSidecarBssSteering, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  selfSidecarPeerTraffic = self->_selfSidecarPeerTraffic;
  if ((unint64_t)selfSidecarPeerTraffic | *((void *)a3 + 14))
  {
    int v5 = -[AWDSidecarPeerTraffic isEqual:](selfSidecarPeerTraffic, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  remoteSidecarPeerTraffic = self->_remoteSidecarPeerTraffic;
  if ((unint64_t)remoteSidecarPeerTraffic | *((void *)a3 + 10))
  {
    int v5 = -[AWDSidecarPeerTraffic isEqual:](remoteSidecarPeerTraffic, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  __int16 v12 = (__int16)self->_has;
  __int16 v13 = *((_WORD *)a3 + 66);
  if ((v12 & 0x40) != 0)
  {
    if ((v13 & 0x40) == 0 || self->_pencilOnCount != *((_DWORD *)a3 + 13)) {
      goto LABEL_69;
    }
  }
  else if ((v13 & 0x40) != 0)
  {
    goto LABEL_69;
  }
  if ((v12 & 0x20) != 0)
  {
    if ((v13 & 0x20) == 0 || self->_pencilOffCount != *((_DWORD *)a3 + 12)) {
      goto LABEL_69;
    }
    goto LABEL_93;
  }
  if ((v13 & 0x20) != 0)
  {
LABEL_69:
    LOBYTE(v5) = 0;
    return v5;
  }
LABEL_93:
  sessionUUID = self->_sessionUUID;
  if ((unint64_t)sessionUUID | *((void *)a3 + 15))
  {
    LOBYTE(v5) = -[NSString isEqual:](sessionUUID, "isEqual:");
  }
  else
  {
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    unint64_t v24 = 2654435761u * self->_timestamp;
    if ((has & 8) != 0)
    {
LABEL_3:
      unint64_t v23 = 2654435761u * self->_selfFgDuration;
      if ((has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else
  {
    unint64_t v24 = 0;
    if ((has & 8) != 0) {
      goto LABEL_3;
    }
  }
  unint64_t v23 = 0;
  if ((has & 4) != 0)
  {
LABEL_4:
    unint64_t v22 = 2654435761u * self->_selfBgDuration;
    if ((*(_WORD *)&self->_has & 0x400) != 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
LABEL_17:
  unint64_t v22 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_5:
    uint64_t v21 = 2654435761 * self->_selfBgEntryCount;
    if ((*(_WORD *)&self->_has & 0x800) != 0) {
      goto LABEL_6;
    }
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v21 = 0;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_6:
    uint64_t v20 = 2654435761 * self->_selfPeerRssi24G;
    if ((*(_WORD *)&self->_has & 0x1000) != 0) {
      goto LABEL_7;
    }
    goto LABEL_20;
  }
LABEL_19:
  uint64_t v20 = 0;
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
LABEL_7:
    uint64_t v19 = 2654435761 * self->_selfPeerRssi5G;
    if ((*(_WORD *)&self->_has & 0x4000) != 0) {
      goto LABEL_8;
    }
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v19 = 0;
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
LABEL_8:
    uint64_t v18 = 2654435761 * self->_selfIsSDB;
    if ((has & 2) != 0) {
      goto LABEL_9;
    }
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v18 = 0;
  if ((has & 2) != 0)
  {
LABEL_9:
    unint64_t v17 = 2654435761u * self->_remoteFgDuration;
    if (has) {
      goto LABEL_10;
    }
    goto LABEL_23;
  }
LABEL_22:
  unint64_t v17 = 0;
  if (has)
  {
LABEL_10:
    unint64_t v4 = 2654435761u * self->_remoteBgDuration;
    if ((has & 0x80) != 0) {
      goto LABEL_11;
    }
    goto LABEL_24;
  }
LABEL_23:
  unint64_t v4 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_11:
    uint64_t v5 = 2654435761 * self->_remoteBgEntryCount;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_12;
    }
    goto LABEL_25;
  }
LABEL_24:
  uint64_t v5 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_12:
    uint64_t v6 = 2654435761 * self->_remotePeerRssi24G;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_13;
    }
LABEL_26:
    uint64_t v7 = 0;
    if ((*(_WORD *)&self->_has & 0x2000) != 0) {
      goto LABEL_14;
    }
    goto LABEL_27;
  }
LABEL_25:
  uint64_t v6 = 0;
  if ((*(_WORD *)&self->_has & 0x200) == 0) {
    goto LABEL_26;
  }
LABEL_13:
  uint64_t v7 = 2654435761 * self->_remotePeerRssi5G;
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
LABEL_14:
    uint64_t v8 = 2654435761 * self->_remotefIsSDB;
    goto LABEL_28;
  }
LABEL_27:
  uint64_t v8 = 0;
LABEL_28:
  unint64_t v9 = [(AWDSidecarBssSteering *)self->_selfSidecarBssSteering hash];
  unint64_t v10 = [(AWDSidecarBssSteering *)self->_remoteSidecarBssSteering hash];
  unint64_t v11 = [(AWDSidecarPeerTraffic *)self->_selfSidecarPeerTraffic hash];
  unint64_t v12 = [(AWDSidecarPeerTraffic *)self->_remoteSidecarPeerTraffic hash];
  __int16 v13 = (__int16)self->_has;
  if ((v13 & 0x40) != 0)
  {
    uint64_t v14 = 2654435761 * self->_pencilOnCount;
    if ((v13 & 0x20) != 0) {
      goto LABEL_30;
    }
LABEL_32:
    uint64_t v15 = 0;
    return v23 ^ v24 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v14 ^ v15 ^ [(NSString *)self->_sessionUUID hash];
  }
  uint64_t v14 = 0;
  if ((v13 & 0x20) == 0) {
    goto LABEL_32;
  }
LABEL_30:
  uint64_t v15 = 2654435761 * self->_pencilOffCount;
  return v23 ^ v24 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v14 ^ v15 ^ [(NSString *)self->_sessionUUID hash];
}

- (void)mergeFrom:(id)a3
{
  __int16 v5 = *((_WORD *)a3 + 66);
  if ((v5 & 0x10) != 0)
  {
    self->_timestamp = *((void *)a3 + 5);
    *(_WORD *)&self->_has |= 0x10u;
    __int16 v5 = *((_WORD *)a3 + 66);
    if ((v5 & 8) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_20;
    }
  }
  else if ((v5 & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_selfFgDuration = *((void *)a3 + 4);
  *(_WORD *)&self->_has |= 8u;
  __int16 v5 = *((_WORD *)a3 + 66);
  if ((v5 & 4) == 0)
  {
LABEL_4:
    if ((v5 & 0x400) == 0) {
      goto LABEL_5;
    }
    goto LABEL_21;
  }
LABEL_20:
  self->_selfBgDuration = *((void *)a3 + 3);
  *(_WORD *)&self->_has |= 4u;
  __int16 v5 = *((_WORD *)a3 + 66);
  if ((v5 & 0x400) == 0)
  {
LABEL_5:
    if ((v5 & 0x800) == 0) {
      goto LABEL_6;
    }
    goto LABEL_22;
  }
LABEL_21:
  self->_selfBgEntryCount = *((_DWORD *)a3 + 22);
  *(_WORD *)&self->_has |= 0x400u;
  __int16 v5 = *((_WORD *)a3 + 66);
  if ((v5 & 0x800) == 0)
  {
LABEL_6:
    if ((v5 & 0x1000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_23;
  }
LABEL_22:
  self->_selfPeerRssi24G = *((_DWORD *)a3 + 23);
  *(_WORD *)&self->_has |= 0x800u;
  __int16 v5 = *((_WORD *)a3 + 66);
  if ((v5 & 0x1000) == 0)
  {
LABEL_7:
    if ((v5 & 0x4000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_24;
  }
LABEL_23:
  self->_selfPeerRssi5G = *((_DWORD *)a3 + 24);
  *(_WORD *)&self->_has |= 0x1000u;
  __int16 v5 = *((_WORD *)a3 + 66);
  if ((v5 & 0x4000) == 0)
  {
LABEL_8:
    if ((v5 & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_25;
  }
LABEL_24:
  self->_selfIsSDB = *((unsigned char *)a3 + 129);
  *(_WORD *)&self->_has |= 0x4000u;
  __int16 v5 = *((_WORD *)a3 + 66);
  if ((v5 & 2) == 0)
  {
LABEL_9:
    if ((v5 & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_26;
  }
LABEL_25:
  self->_remoteFgDuration = *((void *)a3 + 2);
  *(_WORD *)&self->_has |= 2u;
  __int16 v5 = *((_WORD *)a3 + 66);
  if ((v5 & 1) == 0)
  {
LABEL_10:
    if ((v5 & 0x80) == 0) {
      goto LABEL_11;
    }
    goto LABEL_27;
  }
LABEL_26:
  self->_remoteBgDuration = *((void *)a3 + 1);
  *(_WORD *)&self->_has |= 1u;
  __int16 v5 = *((_WORD *)a3 + 66);
  if ((v5 & 0x80) == 0)
  {
LABEL_11:
    if ((v5 & 0x100) == 0) {
      goto LABEL_12;
    }
    goto LABEL_28;
  }
LABEL_27:
  self->_remoteBgEntryCount = *((_DWORD *)a3 + 14);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v5 = *((_WORD *)a3 + 66);
  if ((v5 & 0x100) == 0)
  {
LABEL_12:
    if ((v5 & 0x200) == 0) {
      goto LABEL_13;
    }
    goto LABEL_29;
  }
LABEL_28:
  self->_remotePeerRssi24G = *((_DWORD *)a3 + 15);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v5 = *((_WORD *)a3 + 66);
  if ((v5 & 0x200) == 0)
  {
LABEL_13:
    if ((v5 & 0x2000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_29:
  self->_remotePeerRssi5G = *((_DWORD *)a3 + 16);
  *(_WORD *)&self->_has |= 0x200u;
  if ((*((_WORD *)a3 + 66) & 0x2000) != 0)
  {
LABEL_14:
    self->_remotefIsSDB = *((unsigned char *)a3 + 128);
    *(_WORD *)&self->_has |= 0x2000u;
  }
LABEL_15:
  selfSidecarBssSteering = self->_selfSidecarBssSteering;
  uint64_t v7 = *((void *)a3 + 13);
  if (selfSidecarBssSteering)
  {
    if (v7) {
      -[AWDSidecarBssSteering mergeFrom:](selfSidecarBssSteering, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[AWDWiFiAwdlSidecarCoalesced setSelfSidecarBssSteering:](self, "setSelfSidecarBssSteering:");
  }
  remoteSidecarBssSteering = self->_remoteSidecarBssSteering;
  uint64_t v9 = *((void *)a3 + 9);
  if (remoteSidecarBssSteering)
  {
    if (v9) {
      -[AWDSidecarBssSteering mergeFrom:](remoteSidecarBssSteering, "mergeFrom:");
    }
  }
  else if (v9)
  {
    -[AWDWiFiAwdlSidecarCoalesced setRemoteSidecarBssSteering:](self, "setRemoteSidecarBssSteering:");
  }
  selfSidecarPeerTraffic = self->_selfSidecarPeerTraffic;
  uint64_t v11 = *((void *)a3 + 14);
  if (selfSidecarPeerTraffic)
  {
    if (v11) {
      -[AWDSidecarPeerTraffic mergeFrom:](selfSidecarPeerTraffic, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[AWDWiFiAwdlSidecarCoalesced setSelfSidecarPeerTraffic:](self, "setSelfSidecarPeerTraffic:");
  }
  remoteSidecarPeerTraffic = self->_remoteSidecarPeerTraffic;
  uint64_t v13 = *((void *)a3 + 10);
  if (remoteSidecarPeerTraffic)
  {
    if (v13) {
      -[AWDSidecarPeerTraffic mergeFrom:](remoteSidecarPeerTraffic, "mergeFrom:");
    }
  }
  else if (v13)
  {
    -[AWDWiFiAwdlSidecarCoalesced setRemoteSidecarPeerTraffic:](self, "setRemoteSidecarPeerTraffic:");
  }
  __int16 v14 = *((_WORD *)a3 + 66);
  if ((v14 & 0x40) != 0)
  {
    self->_pencilOnCount = *((_DWORD *)a3 + 13);
    *(_WORD *)&self->_has |= 0x40u;
    __int16 v14 = *((_WORD *)a3 + 66);
  }
  if ((v14 & 0x20) != 0)
  {
    self->_pencilOffCount = *((_DWORD *)a3 + 12);
    *(_WORD *)&self->_has |= 0x20u;
  }
  if (*((void *)a3 + 15))
  {
    -[AWDWiFiAwdlSidecarCoalesced setSessionUUID:](self, "setSessionUUID:");
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unint64_t)selfFgDuration
{
  return self->_selfFgDuration;
}

- (unint64_t)selfBgDuration
{
  return self->_selfBgDuration;
}

- (unsigned)selfBgEntryCount
{
  return self->_selfBgEntryCount;
}

- (int)selfPeerRssi24G
{
  return self->_selfPeerRssi24G;
}

- (int)selfPeerRssi5G
{
  return self->_selfPeerRssi5G;
}

- (BOOL)selfIsSDB
{
  return self->_selfIsSDB;
}

- (unint64_t)remoteFgDuration
{
  return self->_remoteFgDuration;
}

- (unint64_t)remoteBgDuration
{
  return self->_remoteBgDuration;
}

- (unsigned)remoteBgEntryCount
{
  return self->_remoteBgEntryCount;
}

- (int)remotePeerRssi24G
{
  return self->_remotePeerRssi24G;
}

- (int)remotePeerRssi5G
{
  return self->_remotePeerRssi5G;
}

- (BOOL)remotefIsSDB
{
  return self->_remotefIsSDB;
}

- (AWDSidecarBssSteering)selfSidecarBssSteering
{
  return self->_selfSidecarBssSteering;
}

- (void)setSelfSidecarBssSteering:(id)a3
{
}

- (AWDSidecarBssSteering)remoteSidecarBssSteering
{
  return self->_remoteSidecarBssSteering;
}

- (void)setRemoteSidecarBssSteering:(id)a3
{
}

- (AWDSidecarPeerTraffic)selfSidecarPeerTraffic
{
  return self->_selfSidecarPeerTraffic;
}

- (void)setSelfSidecarPeerTraffic:(id)a3
{
}

- (AWDSidecarPeerTraffic)remoteSidecarPeerTraffic
{
  return self->_remoteSidecarPeerTraffic;
}

- (void)setRemoteSidecarPeerTraffic:(id)a3
{
}

- (unsigned)pencilOnCount
{
  return self->_pencilOnCount;
}

- (unsigned)pencilOffCount
{
  return self->_pencilOffCount;
}

- (NSString)sessionUUID
{
  return self->_sessionUUID;
}

- (void)setSessionUUID:(id)a3
{
}

@end