@interface AWDSidecarBssSteering
- (BOOL)hasAttemptPeerCount;
- (BOOL)hasAttemptStatus;
- (BOOL)hasBssSyncChannel;
- (BOOL)hasBssSyncChannelFlags;
- (BOOL)hasCompletionTime;
- (BOOL)hasPeerChannel;
- (BOOL)hasPeerChannelFlags;
- (BOOL)hasPolicyCode;
- (BOOL)hasSelfInfraChannel;
- (BOOL)hasSelfInfraChannelFlags;
- (BOOL)hasTargetChannel;
- (BOOL)hasTargetChannelFlags;
- (BOOL)hasTrafficType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)attemptPeerCount;
- (unsigned)attemptStatus;
- (unsigned)bssSyncChannel;
- (unsigned)bssSyncChannelFlags;
- (unsigned)completionTime;
- (unsigned)peerChannel;
- (unsigned)peerChannelFlags;
- (unsigned)policyCode;
- (unsigned)selfInfraChannel;
- (unsigned)selfInfraChannelFlags;
- (unsigned)targetChannel;
- (unsigned)targetChannelFlags;
- (unsigned)trafficType;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAttemptPeerCount:(unsigned int)a3;
- (void)setAttemptStatus:(unsigned int)a3;
- (void)setBssSyncChannel:(unsigned int)a3;
- (void)setBssSyncChannelFlags:(unsigned int)a3;
- (void)setCompletionTime:(unsigned int)a3;
- (void)setHasAttemptPeerCount:(BOOL)a3;
- (void)setHasAttemptStatus:(BOOL)a3;
- (void)setHasBssSyncChannel:(BOOL)a3;
- (void)setHasBssSyncChannelFlags:(BOOL)a3;
- (void)setHasCompletionTime:(BOOL)a3;
- (void)setHasPeerChannel:(BOOL)a3;
- (void)setHasPeerChannelFlags:(BOOL)a3;
- (void)setHasPolicyCode:(BOOL)a3;
- (void)setHasSelfInfraChannel:(BOOL)a3;
- (void)setHasSelfInfraChannelFlags:(BOOL)a3;
- (void)setHasTargetChannel:(BOOL)a3;
- (void)setHasTargetChannelFlags:(BOOL)a3;
- (void)setHasTrafficType:(BOOL)a3;
- (void)setPeerChannel:(unsigned int)a3;
- (void)setPeerChannelFlags:(unsigned int)a3;
- (void)setPolicyCode:(unsigned int)a3;
- (void)setSelfInfraChannel:(unsigned int)a3;
- (void)setSelfInfraChannelFlags:(unsigned int)a3;
- (void)setTargetChannel:(unsigned int)a3;
- (void)setTargetChannelFlags:(unsigned int)a3;
- (void)setTrafficType:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDSidecarBssSteering

- (void)setTrafficType:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_trafficType = a3;
}

- (void)setHasTrafficType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasTrafficType
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setCompletionTime:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_completionTime = a3;
}

- (void)setHasCompletionTime:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasCompletionTime
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setAttemptStatus:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_attemptStatus = a3;
}

- (void)setHasAttemptStatus:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasAttemptStatus
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setAttemptPeerCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_attemptPeerCount = a3;
}

- (void)setHasAttemptPeerCount:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasAttemptPeerCount
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setBssSyncChannel:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_bssSyncChannel = a3;
}

- (void)setHasBssSyncChannel:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasBssSyncChannel
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setPeerChannel:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_peerChannel = a3;
}

- (void)setHasPeerChannel:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasPeerChannel
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setSelfInfraChannel:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_selfInfraChannel = a3;
}

- (void)setHasSelfInfraChannel:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasSelfInfraChannel
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setTargetChannel:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_targetChannel = a3;
}

- (void)setHasTargetChannel:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasTargetChannel
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setPolicyCode:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_policyCode = a3;
}

- (void)setHasPolicyCode:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasPolicyCode
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setPeerChannelFlags:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_peerChannelFlags = a3;
}

- (void)setHasPeerChannelFlags:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasPeerChannelFlags
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setSelfInfraChannelFlags:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_selfInfraChannelFlags = a3;
}

- (void)setHasSelfInfraChannelFlags:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasSelfInfraChannelFlags
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setBssSyncChannelFlags:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_bssSyncChannelFlags = a3;
}

- (void)setHasBssSyncChannelFlags:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasBssSyncChannelFlags
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setTargetChannelFlags:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_targetChannelFlags = a3;
}

- (void)setHasTargetChannelFlags:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasTargetChannelFlags
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDSidecarBssSteering;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDSidecarBssSteering description](&v3, sel_description), -[AWDSidecarBssSteering dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_trafficType] forKey:@"trafficType"];
    __int16 has = (__int16)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else if ((has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_completionTime] forKey:@"completionTime"];
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
LABEL_18:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_attemptStatus] forKey:@"attemptStatus"];
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_20;
  }
LABEL_19:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_attemptPeerCount] forKey:@"attemptPeerCount"];
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_21;
  }
LABEL_20:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_bssSyncChannel] forKey:@"bssSyncChannel"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x100) == 0) {
      goto LABEL_8;
    }
    goto LABEL_22;
  }
LABEL_21:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_peerChannel] forKey:@"peerChannel"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_8:
    if ((has & 0x400) == 0) {
      goto LABEL_9;
    }
    goto LABEL_23;
  }
LABEL_22:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_selfInfraChannel] forKey:@"selfInfraChannel"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_9:
    if ((has & 0x80) == 0) {
      goto LABEL_10;
    }
    goto LABEL_24;
  }
LABEL_23:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_targetChannel] forKey:@"targetChannel"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_10:
    if ((has & 0x40) == 0) {
      goto LABEL_11;
    }
    goto LABEL_25;
  }
LABEL_24:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_policyCode] forKey:@"policyCode"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_11:
    if ((has & 0x200) == 0) {
      goto LABEL_12;
    }
    goto LABEL_26;
  }
LABEL_25:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_peerChannelFlags] forKey:@"peerChannelFlags"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_12:
    if ((has & 8) == 0) {
      goto LABEL_13;
    }
LABEL_27:
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_bssSyncChannelFlags] forKey:@"bssSyncChannelFlags"];
    if ((*(_WORD *)&self->_has & 0x800) == 0) {
      return v3;
    }
    goto LABEL_14;
  }
LABEL_26:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_selfInfraChannelFlags] forKey:@"selfInfraChannelFlags"];
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_27;
  }
LABEL_13:
  if ((has & 0x800) != 0) {
LABEL_14:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_targetChannelFlags] forKey:@"targetChannelFlags"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDSidecarBssSteeringReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) != 0)
  {
    PBDataWriterWriteUint32Field();
    __int16 has = (__int16)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else if ((has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x100) == 0) {
      goto LABEL_8;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_8:
    if ((has & 0x400) == 0) {
      goto LABEL_9;
    }
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_9:
    if ((has & 0x80) == 0) {
      goto LABEL_10;
    }
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_10:
    if ((has & 0x40) == 0) {
      goto LABEL_11;
    }
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_11:
    if ((has & 0x200) == 0) {
      goto LABEL_12;
    }
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_12:
    if ((has & 8) == 0) {
      goto LABEL_13;
    }
LABEL_26:
    PBDataWriterWriteUint32Field();
    if ((*(_WORD *)&self->_has & 0x800) == 0) {
      return;
    }
    goto LABEL_27;
  }
LABEL_25:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_26;
  }
LABEL_13:
  if ((has & 0x800) == 0) {
    return;
  }
LABEL_27:

  PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) != 0)
  {
    *((_DWORD *)a3 + 14) = self->_trafficType;
    *((_WORD *)a3 + 30) |= 0x1000u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else if ((has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 6) = self->_completionTime;
  *((_WORD *)a3 + 30) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)a3 + 3) = self->_attemptStatus;
  *((_WORD *)a3 + 30) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)a3 + 2) = self->_attemptPeerCount;
  *((_WORD *)a3 + 30) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)a3 + 4) = self->_bssSyncChannel;
  *((_WORD *)a3 + 30) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x100) == 0) {
      goto LABEL_8;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)a3 + 7) = self->_peerChannel;
  *((_WORD *)a3 + 30) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_8:
    if ((has & 0x400) == 0) {
      goto LABEL_9;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)a3 + 10) = self->_selfInfraChannel;
  *((_WORD *)a3 + 30) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_9:
    if ((has & 0x80) == 0) {
      goto LABEL_10;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)a3 + 12) = self->_targetChannel;
  *((_WORD *)a3 + 30) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_10:
    if ((has & 0x40) == 0) {
      goto LABEL_11;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)a3 + 9) = self->_policyCode;
  *((_WORD *)a3 + 30) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_11:
    if ((has & 0x200) == 0) {
      goto LABEL_12;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)a3 + 8) = self->_peerChannelFlags;
  *((_WORD *)a3 + 30) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_12:
    if ((has & 8) == 0) {
      goto LABEL_13;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)a3 + 11) = self->_selfInfraChannelFlags;
  *((_WORD *)a3 + 30) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_13:
    if ((has & 0x800) == 0) {
      return;
    }
LABEL_27:
    *((_DWORD *)a3 + 13) = self->_targetChannelFlags;
    *((_WORD *)a3 + 30) |= 0x800u;
    return;
  }
LABEL_26:
  *((_DWORD *)a3 + 5) = self->_bssSyncChannelFlags;
  *((_WORD *)a3 + 30) |= 8u;
  if ((*(_WORD *)&self->_has & 0x800) != 0) {
    goto LABEL_27;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(id)[(id)[(id)objc_opt_class() allocWithZone:a3] init];
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) != 0)
  {
    *((_DWORD *)result + 14) = self->_trafficType;
    *((_WORD *)result + 30) |= 0x1000u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else if ((has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 6) = self->_completionTime;
  *((_WORD *)result + 30) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)result + 3) = self->_attemptStatus;
  *((_WORD *)result + 30) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)result + 2) = self->_attemptPeerCount;
  *((_WORD *)result + 30) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)result + 4) = self->_bssSyncChannel;
  *((_WORD *)result + 30) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x100) == 0) {
      goto LABEL_8;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)result + 7) = self->_peerChannel;
  *((_WORD *)result + 30) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_8:
    if ((has & 0x400) == 0) {
      goto LABEL_9;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)result + 10) = self->_selfInfraChannel;
  *((_WORD *)result + 30) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_9:
    if ((has & 0x80) == 0) {
      goto LABEL_10;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)result + 12) = self->_targetChannel;
  *((_WORD *)result + 30) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_10:
    if ((has & 0x40) == 0) {
      goto LABEL_11;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)result + 9) = self->_policyCode;
  *((_WORD *)result + 30) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_11:
    if ((has & 0x200) == 0) {
      goto LABEL_12;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)result + 8) = self->_peerChannelFlags;
  *((_WORD *)result + 30) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_12:
    if ((has & 8) == 0) {
      goto LABEL_13;
    }
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)result + 11) = self->_selfInfraChannelFlags;
  *((_WORD *)result + 30) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_13:
    if ((has & 0x800) == 0) {
      return result;
    }
    goto LABEL_14;
  }
LABEL_27:
  *((_DWORD *)result + 5) = self->_bssSyncChannelFlags;
  *((_WORD *)result + 30) |= 8u;
  if ((*(_WORD *)&self->_has & 0x800) == 0) {
    return result;
  }
LABEL_14:
  *((_DWORD *)result + 13) = self->_targetChannelFlags;
  *((_WORD *)result + 30) |= 0x800u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    __int16 has = (__int16)self->_has;
    __int16 v7 = *((_WORD *)a3 + 30);
    if ((has & 0x1000) != 0)
    {
      if ((*((_WORD *)a3 + 30) & 0x1000) == 0 || self->_trafficType != *((_DWORD *)a3 + 14)) {
        goto LABEL_66;
      }
    }
    else if ((*((_WORD *)a3 + 30) & 0x1000) != 0)
    {
LABEL_66:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_completionTime != *((_DWORD *)a3 + 6)) {
        goto LABEL_66;
      }
    }
    else if ((v7 & 0x10) != 0)
    {
      goto LABEL_66;
    }
    if ((has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_attemptStatus != *((_DWORD *)a3 + 3)) {
        goto LABEL_66;
      }
    }
    else if ((v7 & 2) != 0)
    {
      goto LABEL_66;
    }
    if (has)
    {
      if ((v7 & 1) == 0 || self->_attemptPeerCount != *((_DWORD *)a3 + 2)) {
        goto LABEL_66;
      }
    }
    else if (v7)
    {
      goto LABEL_66;
    }
    if ((has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_bssSyncChannel != *((_DWORD *)a3 + 4)) {
        goto LABEL_66;
      }
    }
    else if ((v7 & 4) != 0)
    {
      goto LABEL_66;
    }
    if ((has & 0x20) != 0)
    {
      if ((v7 & 0x20) == 0 || self->_peerChannel != *((_DWORD *)a3 + 7)) {
        goto LABEL_66;
      }
    }
    else if ((v7 & 0x20) != 0)
    {
      goto LABEL_66;
    }
    if ((*(_WORD *)&self->_has & 0x100) != 0)
    {
      if ((*((_WORD *)a3 + 30) & 0x100) == 0 || self->_selfInfraChannel != *((_DWORD *)a3 + 10)) {
        goto LABEL_66;
      }
    }
    else if ((*((_WORD *)a3 + 30) & 0x100) != 0)
    {
      goto LABEL_66;
    }
    if ((*(_WORD *)&self->_has & 0x400) != 0)
    {
      if ((*((_WORD *)a3 + 30) & 0x400) == 0 || self->_targetChannel != *((_DWORD *)a3 + 12)) {
        goto LABEL_66;
      }
    }
    else if ((*((_WORD *)a3 + 30) & 0x400) != 0)
    {
      goto LABEL_66;
    }
    if ((has & 0x80) != 0)
    {
      if ((v7 & 0x80) == 0 || self->_policyCode != *((_DWORD *)a3 + 9)) {
        goto LABEL_66;
      }
    }
    else if ((v7 & 0x80) != 0)
    {
      goto LABEL_66;
    }
    if ((has & 0x40) != 0)
    {
      if ((v7 & 0x40) == 0 || self->_peerChannelFlags != *((_DWORD *)a3 + 8)) {
        goto LABEL_66;
      }
    }
    else if ((v7 & 0x40) != 0)
    {
      goto LABEL_66;
    }
    if ((*(_WORD *)&self->_has & 0x200) != 0)
    {
      if ((*((_WORD *)a3 + 30) & 0x200) == 0 || self->_selfInfraChannelFlags != *((_DWORD *)a3 + 11)) {
        goto LABEL_66;
      }
    }
    else if ((*((_WORD *)a3 + 30) & 0x200) != 0)
    {
      goto LABEL_66;
    }
    if ((has & 8) != 0)
    {
      if ((v7 & 8) == 0 || self->_bssSyncChannelFlags != *((_DWORD *)a3 + 5)) {
        goto LABEL_66;
      }
    }
    else if ((v7 & 8) != 0)
    {
      goto LABEL_66;
    }
    LOBYTE(v5) = (v7 & 0x800) == 0;
    if ((*(_WORD *)&self->_has & 0x800) != 0)
    {
      if ((*((_WORD *)a3 + 30) & 0x800) == 0 || self->_targetChannelFlags != *((_DWORD *)a3 + 13)) {
        goto LABEL_66;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) != 0)
  {
    uint64_t v3 = 2654435761 * self->_trafficType;
    if ((has & 0x10) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_completionTime;
      if ((has & 2) != 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((has & 0x10) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((has & 2) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_attemptStatus;
    if (has) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v5 = 0;
  if (has)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_attemptPeerCount;
    if ((has & 4) != 0) {
      goto LABEL_6;
    }
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v6 = 0;
  if ((has & 4) != 0)
  {
LABEL_6:
    uint64_t v7 = 2654435761 * self->_bssSyncChannel;
    if ((has & 0x20) != 0) {
      goto LABEL_7;
    }
    goto LABEL_20;
  }
LABEL_19:
  uint64_t v7 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_7:
    uint64_t v8 = 2654435761 * self->_peerChannel;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_8;
    }
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v8 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_8:
    uint64_t v9 = 2654435761 * self->_selfInfraChannel;
    if ((*(_WORD *)&self->_has & 0x400) != 0) {
      goto LABEL_9;
    }
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v9 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_9:
    uint64_t v10 = 2654435761 * self->_targetChannel;
    if ((has & 0x80) != 0) {
      goto LABEL_10;
    }
    goto LABEL_23;
  }
LABEL_22:
  uint64_t v10 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_10:
    uint64_t v11 = 2654435761 * self->_policyCode;
    if ((has & 0x40) != 0) {
      goto LABEL_11;
    }
    goto LABEL_24;
  }
LABEL_23:
  uint64_t v11 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_11:
    uint64_t v12 = 2654435761 * self->_peerChannelFlags;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_12;
    }
    goto LABEL_25;
  }
LABEL_24:
  uint64_t v12 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_12:
    uint64_t v13 = 2654435761 * self->_selfInfraChannelFlags;
    if ((has & 8) != 0) {
      goto LABEL_13;
    }
LABEL_26:
    uint64_t v14 = 0;
    if ((*(_WORD *)&self->_has & 0x800) != 0) {
      goto LABEL_14;
    }
LABEL_27:
    uint64_t v15 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15;
  }
LABEL_25:
  uint64_t v13 = 0;
  if ((has & 8) == 0) {
    goto LABEL_26;
  }
LABEL_13:
  uint64_t v14 = 2654435761 * self->_bssSyncChannelFlags;
  if ((*(_WORD *)&self->_has & 0x800) == 0) {
    goto LABEL_27;
  }
LABEL_14:
  uint64_t v15 = 2654435761 * self->_targetChannelFlags;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15;
}

- (void)mergeFrom:(id)a3
{
  __int16 v3 = *((_WORD *)a3 + 30);
  if ((v3 & 0x1000) != 0)
  {
    self->_trafficType = *((_DWORD *)a3 + 14);
    *(_WORD *)&self->_has |= 0x1000u;
    __int16 v3 = *((_WORD *)a3 + 30);
    if ((v3 & 0x10) == 0)
    {
LABEL_3:
      if ((v3 & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else if ((v3 & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_completionTime = *((_DWORD *)a3 + 6);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v3 = *((_WORD *)a3 + 30);
  if ((v3 & 2) == 0)
  {
LABEL_4:
    if ((v3 & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
LABEL_17:
  self->_attemptStatus = *((_DWORD *)a3 + 3);
  *(_WORD *)&self->_has |= 2u;
  __int16 v3 = *((_WORD *)a3 + 30);
  if ((v3 & 1) == 0)
  {
LABEL_5:
    if ((v3 & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_19;
  }
LABEL_18:
  self->_attemptPeerCount = *((_DWORD *)a3 + 2);
  *(_WORD *)&self->_has |= 1u;
  __int16 v3 = *((_WORD *)a3 + 30);
  if ((v3 & 4) == 0)
  {
LABEL_6:
    if ((v3 & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_20;
  }
LABEL_19:
  self->_bssSyncChannel = *((_DWORD *)a3 + 4);
  *(_WORD *)&self->_has |= 4u;
  __int16 v3 = *((_WORD *)a3 + 30);
  if ((v3 & 0x20) == 0)
  {
LABEL_7:
    if ((v3 & 0x100) == 0) {
      goto LABEL_8;
    }
    goto LABEL_21;
  }
LABEL_20:
  self->_peerChannel = *((_DWORD *)a3 + 7);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v3 = *((_WORD *)a3 + 30);
  if ((v3 & 0x100) == 0)
  {
LABEL_8:
    if ((v3 & 0x400) == 0) {
      goto LABEL_9;
    }
    goto LABEL_22;
  }
LABEL_21:
  self->_selfInfraChannel = *((_DWORD *)a3 + 10);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v3 = *((_WORD *)a3 + 30);
  if ((v3 & 0x400) == 0)
  {
LABEL_9:
    if ((v3 & 0x80) == 0) {
      goto LABEL_10;
    }
    goto LABEL_23;
  }
LABEL_22:
  self->_targetChannel = *((_DWORD *)a3 + 12);
  *(_WORD *)&self->_has |= 0x400u;
  __int16 v3 = *((_WORD *)a3 + 30);
  if ((v3 & 0x80) == 0)
  {
LABEL_10:
    if ((v3 & 0x40) == 0) {
      goto LABEL_11;
    }
    goto LABEL_24;
  }
LABEL_23:
  self->_policyCode = *((_DWORD *)a3 + 9);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v3 = *((_WORD *)a3 + 30);
  if ((v3 & 0x40) == 0)
  {
LABEL_11:
    if ((v3 & 0x200) == 0) {
      goto LABEL_12;
    }
    goto LABEL_25;
  }
LABEL_24:
  self->_peerChannelFlags = *((_DWORD *)a3 + 8);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v3 = *((_WORD *)a3 + 30);
  if ((v3 & 0x200) == 0)
  {
LABEL_12:
    if ((v3 & 8) == 0) {
      goto LABEL_13;
    }
    goto LABEL_26;
  }
LABEL_25:
  self->_selfInfraChannelFlags = *((_DWORD *)a3 + 11);
  *(_WORD *)&self->_has |= 0x200u;
  __int16 v3 = *((_WORD *)a3 + 30);
  if ((v3 & 8) == 0)
  {
LABEL_13:
    if ((v3 & 0x800) == 0) {
      return;
    }
LABEL_27:
    self->_targetChannelFlags = *((_DWORD *)a3 + 13);
    *(_WORD *)&self->_has |= 0x800u;
    return;
  }
LABEL_26:
  self->_bssSyncChannelFlags = *((_DWORD *)a3 + 5);
  *(_WORD *)&self->_has |= 8u;
  if ((*((_WORD *)a3 + 30) & 0x800) != 0) {
    goto LABEL_27;
  }
}

- (unsigned)trafficType
{
  return self->_trafficType;
}

- (unsigned)completionTime
{
  return self->_completionTime;
}

- (unsigned)attemptStatus
{
  return self->_attemptStatus;
}

- (unsigned)attemptPeerCount
{
  return self->_attemptPeerCount;
}

- (unsigned)bssSyncChannel
{
  return self->_bssSyncChannel;
}

- (unsigned)peerChannel
{
  return self->_peerChannel;
}

- (unsigned)selfInfraChannel
{
  return self->_selfInfraChannel;
}

- (unsigned)targetChannel
{
  return self->_targetChannel;
}

- (unsigned)policyCode
{
  return self->_policyCode;
}

- (unsigned)peerChannelFlags
{
  return self->_peerChannelFlags;
}

- (unsigned)selfInfraChannelFlags
{
  return self->_selfInfraChannelFlags;
}

- (unsigned)bssSyncChannelFlags
{
  return self->_bssSyncChannelFlags;
}

- (unsigned)targetChannelFlags
{
  return self->_targetChannelFlags;
}

@end