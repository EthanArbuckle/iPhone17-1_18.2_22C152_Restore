@interface AWDWiFiRangingRttData
- (BOOL)hasBitErrorRate;
- (BOOL)hasChannel;
- (BOOL)hasCoreId;
- (BOOL)hasFlags;
- (BOOL)hasLosPeakRatio;
- (BOOL)hasPeerBitErrorRate;
- (BOOL)hasPeerCoreId;
- (BOOL)hasPeerLosPeakRatio;
- (BOOL)hasPeerPhyError;
- (BOOL)hasPeerSnr;
- (BOOL)hasPhyError;
- (BOOL)hasRssi;
- (BOOL)hasRtt;
- (BOOL)hasSnr;
- (BOOL)hasStatus;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)rssi;
- (unint64_t)hash;
- (unsigned)bitErrorRate;
- (unsigned)channel;
- (unsigned)coreId;
- (unsigned)flags;
- (unsigned)losPeakRatio;
- (unsigned)peerBitErrorRate;
- (unsigned)peerCoreId;
- (unsigned)peerLosPeakRatio;
- (unsigned)peerPhyError;
- (unsigned)peerSnr;
- (unsigned)phyError;
- (unsigned)rtt;
- (unsigned)snr;
- (unsigned)status;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBitErrorRate:(unsigned int)a3;
- (void)setChannel:(unsigned int)a3;
- (void)setCoreId:(unsigned int)a3;
- (void)setFlags:(unsigned int)a3;
- (void)setHasBitErrorRate:(BOOL)a3;
- (void)setHasChannel:(BOOL)a3;
- (void)setHasCoreId:(BOOL)a3;
- (void)setHasFlags:(BOOL)a3;
- (void)setHasLosPeakRatio:(BOOL)a3;
- (void)setHasPeerBitErrorRate:(BOOL)a3;
- (void)setHasPeerCoreId:(BOOL)a3;
- (void)setHasPeerLosPeakRatio:(BOOL)a3;
- (void)setHasPeerPhyError:(BOOL)a3;
- (void)setHasPeerSnr:(BOOL)a3;
- (void)setHasPhyError:(BOOL)a3;
- (void)setHasRssi:(BOOL)a3;
- (void)setHasRtt:(BOOL)a3;
- (void)setHasSnr:(BOOL)a3;
- (void)setHasStatus:(BOOL)a3;
- (void)setLosPeakRatio:(unsigned int)a3;
- (void)setPeerBitErrorRate:(unsigned int)a3;
- (void)setPeerCoreId:(unsigned int)a3;
- (void)setPeerLosPeakRatio:(unsigned int)a3;
- (void)setPeerPhyError:(unsigned int)a3;
- (void)setPeerSnr:(unsigned int)a3;
- (void)setPhyError:(unsigned int)a3;
- (void)setRssi:(int)a3;
- (void)setRtt:(unsigned int)a3;
- (void)setSnr:(unsigned int)a3;
- (void)setStatus:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDWiFiRangingRttData

- (void)setFlags:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_flags = a3;
}

- (void)setHasFlags:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasFlags
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setRtt:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_rtt = a3;
}

- (void)setHasRtt:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasRtt
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setRssi:(int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_rssi = a3;
}

- (void)setHasRssi:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasRssi
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setSnr:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_snr = a3;
}

- (void)setHasSnr:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x2000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasSnr
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setCoreId:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_coreId = a3;
}

- (void)setHasCoreId:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasCoreId
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setLosPeakRatio:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_losPeakRatio = a3;
}

- (void)setHasLosPeakRatio:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasLosPeakRatio
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setBitErrorRate:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_bitErrorRate = a3;
}

- (void)setHasBitErrorRate:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasBitErrorRate
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setPhyError:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_phyError = a3;
}

- (void)setHasPhyError:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasPhyError
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setStatus:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x4000u;
  self->_status = a3;
}

- (void)setHasStatus:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x4000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xBFFF | v3;
}

- (BOOL)hasStatus
{
  return (*(_WORD *)&self->_has >> 14) & 1;
}

- (void)setPeerSnr:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_peerSnr = a3;
}

- (void)setHasPeerSnr:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasPeerSnr
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setPeerLosPeakRatio:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_peerLosPeakRatio = a3;
}

- (void)setHasPeerLosPeakRatio:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasPeerLosPeakRatio
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setPeerCoreId:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_peerCoreId = a3;
}

- (void)setHasPeerCoreId:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasPeerCoreId
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setPeerBitErrorRate:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_peerBitErrorRate = a3;
}

- (void)setHasPeerBitErrorRate:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasPeerBitErrorRate
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setPeerPhyError:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_peerPhyError = a3;
}

- (void)setHasPeerPhyError:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasPeerPhyError
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setChannel:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_channel = a3;
}

- (void)setHasChannel:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasChannel
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiRangingRttData;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWiFiRangingRttData description](&v3, sel_description), -[AWDWiFiRangingRttData dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_flags] forKey:@"flags"];
    __int16 has = (__int16)self->_has;
    if ((has & 0x1000) == 0)
    {
LABEL_3:
      if ((has & 0x800) == 0) {
        goto LABEL_4;
      }
      goto LABEL_20;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x1000) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_rtt] forKey:@"rtt"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_4:
    if ((has & 0x2000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_21;
  }
LABEL_20:
  [v3 setObject:[NSNumber numberWithInt:self->_rssi] forKey:@"rssi"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_22;
  }
LABEL_21:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_snr] forKey:@"snr"];
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_23;
  }
LABEL_22:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_coreId] forKey:@"coreId"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_24;
  }
LABEL_23:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_losPeakRatio] forKey:@"losPeakRatio"];
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_8:
    if ((has & 0x400) == 0) {
      goto LABEL_9;
    }
    goto LABEL_25;
  }
LABEL_24:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_bitErrorRate] forKey:@"bitErrorRate"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_9:
    if ((has & 0x4000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_26;
  }
LABEL_25:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_phyError] forKey:@"phyError"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_27;
  }
LABEL_26:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_status] forKey:@"status"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_11:
    if ((has & 0x80) == 0) {
      goto LABEL_12;
    }
    goto LABEL_28;
  }
LABEL_27:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_peerSnr] forKey:@"peerSnr"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_12:
    if ((has & 0x40) == 0) {
      goto LABEL_13;
    }
    goto LABEL_29;
  }
LABEL_28:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_peerLosPeakRatio] forKey:@"peerLosPeakRatio"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_13:
    if ((has & 0x20) == 0) {
      goto LABEL_14;
    }
    goto LABEL_30;
  }
LABEL_29:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_peerCoreId] forKey:@"peerCoreId"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_14:
    if ((has & 0x100) == 0) {
      goto LABEL_15;
    }
LABEL_31:
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_peerPhyError] forKey:@"peerPhyError"];
    if ((*(_WORD *)&self->_has & 2) == 0) {
      return v3;
    }
    goto LABEL_16;
  }
LABEL_30:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_peerBitErrorRate] forKey:@"peerBitErrorRate"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0) {
    goto LABEL_31;
  }
LABEL_15:
  if ((has & 2) != 0) {
LABEL_16:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_channel] forKey:@"channel"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiRangingRttDataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteUint32Field();
    __int16 has = (__int16)self->_has;
    if ((has & 0x1000) == 0)
    {
LABEL_3:
      if ((has & 0x800) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x1000) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_4:
    if ((has & 0x2000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_8:
    if ((has & 0x400) == 0) {
      goto LABEL_9;
    }
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_9:
    if ((has & 0x4000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_11:
    if ((has & 0x80) == 0) {
      goto LABEL_12;
    }
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_12:
    if ((has & 0x40) == 0) {
      goto LABEL_13;
    }
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_13:
    if ((has & 0x20) == 0) {
      goto LABEL_14;
    }
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_14:
    if ((has & 0x100) == 0) {
      goto LABEL_15;
    }
LABEL_30:
    PBDataWriterWriteUint32Field();
    if ((*(_WORD *)&self->_has & 2) == 0) {
      return;
    }
    goto LABEL_31;
  }
LABEL_29:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0) {
    goto LABEL_30;
  }
LABEL_15:
  if ((has & 2) == 0) {
    return;
  }
LABEL_31:

  PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    *((_DWORD *)a3 + 5) = self->_flags;
    *((_WORD *)a3 + 34) |= 8u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x1000) == 0)
    {
LABEL_3:
      if ((has & 0x800) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x1000) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 14) = self->_rtt;
  *((_WORD *)a3 + 34) |= 0x1000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_4:
    if ((has & 0x2000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)a3 + 13) = self->_rssi;
  *((_WORD *)a3 + 34) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)a3 + 15) = self->_snr;
  *((_WORD *)a3 + 34) |= 0x2000u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)a3 + 4) = self->_coreId;
  *((_WORD *)a3 + 34) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)a3 + 6) = self->_losPeakRatio;
  *((_WORD *)a3 + 34) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_8:
    if ((has & 0x400) == 0) {
      goto LABEL_9;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)a3 + 2) = self->_bitErrorRate;
  *((_WORD *)a3 + 34) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_9:
    if ((has & 0x4000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)a3 + 12) = self->_phyError;
  *((_WORD *)a3 + 34) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)a3 + 16) = self->_status;
  *((_WORD *)a3 + 34) |= 0x4000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_11:
    if ((has & 0x80) == 0) {
      goto LABEL_12;
    }
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)a3 + 11) = self->_peerSnr;
  *((_WORD *)a3 + 34) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_12:
    if ((has & 0x40) == 0) {
      goto LABEL_13;
    }
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)a3 + 9) = self->_peerLosPeakRatio;
  *((_WORD *)a3 + 34) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_13:
    if ((has & 0x20) == 0) {
      goto LABEL_14;
    }
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)a3 + 8) = self->_peerCoreId;
  *((_WORD *)a3 + 34) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_14:
    if ((has & 0x100) == 0) {
      goto LABEL_15;
    }
    goto LABEL_30;
  }
LABEL_29:
  *((_DWORD *)a3 + 7) = self->_peerBitErrorRate;
  *((_WORD *)a3 + 34) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_15:
    if ((has & 2) == 0) {
      return;
    }
LABEL_31:
    *((_DWORD *)a3 + 3) = self->_channel;
    *((_WORD *)a3 + 34) |= 2u;
    return;
  }
LABEL_30:
  *((_DWORD *)a3 + 10) = self->_peerPhyError;
  *((_WORD *)a3 + 34) |= 0x100u;
  if ((*(_WORD *)&self->_has & 2) != 0) {
    goto LABEL_31;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(id)[(id)[(id)objc_opt_class() allocWithZone:a3] init];
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    *((_DWORD *)result + 5) = self->_flags;
    *((_WORD *)result + 34) |= 8u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x1000) == 0)
    {
LABEL_3:
      if ((has & 0x800) == 0) {
        goto LABEL_4;
      }
      goto LABEL_20;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x1000) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 14) = self->_rtt;
  *((_WORD *)result + 34) |= 0x1000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_4:
    if ((has & 0x2000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)result + 13) = self->_rssi;
  *((_WORD *)result + 34) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)result + 15) = self->_snr;
  *((_WORD *)result + 34) |= 0x2000u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)result + 4) = self->_coreId;
  *((_WORD *)result + 34) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)result + 6) = self->_losPeakRatio;
  *((_WORD *)result + 34) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_8:
    if ((has & 0x400) == 0) {
      goto LABEL_9;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)result + 2) = self->_bitErrorRate;
  *((_WORD *)result + 34) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_9:
    if ((has & 0x4000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)result + 12) = self->_phyError;
  *((_WORD *)result + 34) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)result + 16) = self->_status;
  *((_WORD *)result + 34) |= 0x4000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_11:
    if ((has & 0x80) == 0) {
      goto LABEL_12;
    }
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)result + 11) = self->_peerSnr;
  *((_WORD *)result + 34) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_12:
    if ((has & 0x40) == 0) {
      goto LABEL_13;
    }
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)result + 9) = self->_peerLosPeakRatio;
  *((_WORD *)result + 34) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_13:
    if ((has & 0x20) == 0) {
      goto LABEL_14;
    }
    goto LABEL_30;
  }
LABEL_29:
  *((_DWORD *)result + 8) = self->_peerCoreId;
  *((_WORD *)result + 34) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_14:
    if ((has & 0x100) == 0) {
      goto LABEL_15;
    }
    goto LABEL_31;
  }
LABEL_30:
  *((_DWORD *)result + 7) = self->_peerBitErrorRate;
  *((_WORD *)result + 34) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_15:
    if ((has & 2) == 0) {
      return result;
    }
    goto LABEL_16;
  }
LABEL_31:
  *((_DWORD *)result + 10) = self->_peerPhyError;
  *((_WORD *)result + 34) |= 0x100u;
  if ((*(_WORD *)&self->_has & 2) == 0) {
    return result;
  }
LABEL_16:
  *((_DWORD *)result + 3) = self->_channel;
  *((_WORD *)result + 34) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    __int16 has = (__int16)self->_has;
    __int16 v7 = *((_WORD *)a3 + 34);
    if ((has & 8) != 0)
    {
      if ((v7 & 8) == 0 || self->_flags != *((_DWORD *)a3 + 5)) {
        goto LABEL_76;
      }
    }
    else if ((v7 & 8) != 0)
    {
LABEL_76:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_WORD *)&self->_has & 0x1000) != 0)
    {
      if ((*((_WORD *)a3 + 34) & 0x1000) == 0 || self->_rtt != *((_DWORD *)a3 + 14)) {
        goto LABEL_76;
      }
    }
    else if ((*((_WORD *)a3 + 34) & 0x1000) != 0)
    {
      goto LABEL_76;
    }
    if ((*(_WORD *)&self->_has & 0x800) != 0)
    {
      if ((*((_WORD *)a3 + 34) & 0x800) == 0 || self->_rssi != *((_DWORD *)a3 + 13)) {
        goto LABEL_76;
      }
    }
    else if ((*((_WORD *)a3 + 34) & 0x800) != 0)
    {
      goto LABEL_76;
    }
    if ((*(_WORD *)&self->_has & 0x2000) != 0)
    {
      if ((*((_WORD *)a3 + 34) & 0x2000) == 0 || self->_snr != *((_DWORD *)a3 + 15)) {
        goto LABEL_76;
      }
    }
    else if ((*((_WORD *)a3 + 34) & 0x2000) != 0)
    {
      goto LABEL_76;
    }
    if ((has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_coreId != *((_DWORD *)a3 + 4)) {
        goto LABEL_76;
      }
    }
    else if ((v7 & 4) != 0)
    {
      goto LABEL_76;
    }
    if ((has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_losPeakRatio != *((_DWORD *)a3 + 6)) {
        goto LABEL_76;
      }
    }
    else if ((v7 & 0x10) != 0)
    {
      goto LABEL_76;
    }
    if (has)
    {
      if ((v7 & 1) == 0 || self->_bitErrorRate != *((_DWORD *)a3 + 2)) {
        goto LABEL_76;
      }
    }
    else if (v7)
    {
      goto LABEL_76;
    }
    if ((*(_WORD *)&self->_has & 0x400) != 0)
    {
      if ((*((_WORD *)a3 + 34) & 0x400) == 0 || self->_phyError != *((_DWORD *)a3 + 12)) {
        goto LABEL_76;
      }
    }
    else if ((*((_WORD *)a3 + 34) & 0x400) != 0)
    {
      goto LABEL_76;
    }
    if ((*(_WORD *)&self->_has & 0x4000) != 0)
    {
      if ((*((_WORD *)a3 + 34) & 0x4000) == 0 || self->_status != *((_DWORD *)a3 + 16)) {
        goto LABEL_76;
      }
    }
    else if ((*((_WORD *)a3 + 34) & 0x4000) != 0)
    {
      goto LABEL_76;
    }
    if ((*(_WORD *)&self->_has & 0x200) != 0)
    {
      if ((*((_WORD *)a3 + 34) & 0x200) == 0 || self->_peerSnr != *((_DWORD *)a3 + 11)) {
        goto LABEL_76;
      }
    }
    else if ((*((_WORD *)a3 + 34) & 0x200) != 0)
    {
      goto LABEL_76;
    }
    if ((has & 0x80) != 0)
    {
      if ((v7 & 0x80) == 0 || self->_peerLosPeakRatio != *((_DWORD *)a3 + 9)) {
        goto LABEL_76;
      }
    }
    else if ((v7 & 0x80) != 0)
    {
      goto LABEL_76;
    }
    if ((has & 0x40) != 0)
    {
      if ((v7 & 0x40) == 0 || self->_peerCoreId != *((_DWORD *)a3 + 8)) {
        goto LABEL_76;
      }
    }
    else if ((v7 & 0x40) != 0)
    {
      goto LABEL_76;
    }
    if ((has & 0x20) != 0)
    {
      if ((v7 & 0x20) == 0 || self->_peerBitErrorRate != *((_DWORD *)a3 + 7)) {
        goto LABEL_76;
      }
    }
    else if ((v7 & 0x20) != 0)
    {
      goto LABEL_76;
    }
    if ((*(_WORD *)&self->_has & 0x100) != 0)
    {
      if ((*((_WORD *)a3 + 34) & 0x100) == 0 || self->_peerPhyError != *((_DWORD *)a3 + 10)) {
        goto LABEL_76;
      }
    }
    else if ((*((_WORD *)a3 + 34) & 0x100) != 0)
    {
      goto LABEL_76;
    }
    LOBYTE(v5) = (v7 & 2) == 0;
    if ((has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_channel != *((_DWORD *)a3 + 3)) {
        goto LABEL_76;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    uint64_t v3 = 2654435761 * self->_flags;
    if ((*(_WORD *)&self->_has & 0x1000) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_rtt;
      if ((*(_WORD *)&self->_has & 0x800) != 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(_WORD *)&self->_has & 0x1000) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_rssi;
    if ((*(_WORD *)&self->_has & 0x2000) != 0) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }
LABEL_19:
  uint64_t v5 = 0;
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_snr;
    if ((has & 4) != 0) {
      goto LABEL_6;
    }
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v6 = 0;
  if ((has & 4) != 0)
  {
LABEL_6:
    uint64_t v7 = 2654435761 * self->_coreId;
    if ((has & 0x10) != 0) {
      goto LABEL_7;
    }
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v7 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_7:
    uint64_t v8 = 2654435761 * self->_losPeakRatio;
    if (has) {
      goto LABEL_8;
    }
    goto LABEL_23;
  }
LABEL_22:
  uint64_t v8 = 0;
  if (has)
  {
LABEL_8:
    uint64_t v9 = 2654435761 * self->_bitErrorRate;
    if ((*(_WORD *)&self->_has & 0x400) != 0) {
      goto LABEL_9;
    }
    goto LABEL_24;
  }
LABEL_23:
  uint64_t v9 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_9:
    uint64_t v10 = 2654435761 * self->_phyError;
    if ((*(_WORD *)&self->_has & 0x4000) != 0) {
      goto LABEL_10;
    }
    goto LABEL_25;
  }
LABEL_24:
  uint64_t v10 = 0;
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
LABEL_10:
    uint64_t v11 = 2654435761 * self->_status;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_11;
    }
    goto LABEL_26;
  }
LABEL_25:
  uint64_t v11 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_11:
    uint64_t v12 = 2654435761 * self->_peerSnr;
    if ((has & 0x80) != 0) {
      goto LABEL_12;
    }
    goto LABEL_27;
  }
LABEL_26:
  uint64_t v12 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_12:
    uint64_t v13 = 2654435761 * self->_peerLosPeakRatio;
    if ((has & 0x40) != 0) {
      goto LABEL_13;
    }
    goto LABEL_28;
  }
LABEL_27:
  uint64_t v13 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_13:
    uint64_t v14 = 2654435761 * self->_peerCoreId;
    if ((has & 0x20) != 0) {
      goto LABEL_14;
    }
    goto LABEL_29;
  }
LABEL_28:
  uint64_t v14 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_14:
    uint64_t v15 = 2654435761 * self->_peerBitErrorRate;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_15;
    }
LABEL_30:
    uint64_t v16 = 0;
    if ((has & 2) != 0) {
      goto LABEL_16;
    }
LABEL_31:
    uint64_t v17 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17;
  }
LABEL_29:
  uint64_t v15 = 0;
  if ((*(_WORD *)&self->_has & 0x100) == 0) {
    goto LABEL_30;
  }
LABEL_15:
  uint64_t v16 = 2654435761 * self->_peerPhyError;
  if ((has & 2) == 0) {
    goto LABEL_31;
  }
LABEL_16:
  uint64_t v17 = 2654435761 * self->_channel;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17;
}

- (void)mergeFrom:(id)a3
{
  __int16 v3 = *((_WORD *)a3 + 34);
  if ((v3 & 8) != 0)
  {
    self->_flags = *((_DWORD *)a3 + 5);
    *(_WORD *)&self->_has |= 8u;
    __int16 v3 = *((_WORD *)a3 + 34);
    if ((v3 & 0x1000) == 0)
    {
LABEL_3:
      if ((v3 & 0x800) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else if ((*((_WORD *)a3 + 34) & 0x1000) == 0)
  {
    goto LABEL_3;
  }
  self->_rtt = *((_DWORD *)a3 + 14);
  *(_WORD *)&self->_has |= 0x1000u;
  __int16 v3 = *((_WORD *)a3 + 34);
  if ((v3 & 0x800) == 0)
  {
LABEL_4:
    if ((v3 & 0x2000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }
LABEL_19:
  self->_rssi = *((_DWORD *)a3 + 13);
  *(_WORD *)&self->_has |= 0x800u;
  __int16 v3 = *((_WORD *)a3 + 34);
  if ((v3 & 0x2000) == 0)
  {
LABEL_5:
    if ((v3 & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_21;
  }
LABEL_20:
  self->_snr = *((_DWORD *)a3 + 15);
  *(_WORD *)&self->_has |= 0x2000u;
  __int16 v3 = *((_WORD *)a3 + 34);
  if ((v3 & 4) == 0)
  {
LABEL_6:
    if ((v3 & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_22;
  }
LABEL_21:
  self->_coreId = *((_DWORD *)a3 + 4);
  *(_WORD *)&self->_has |= 4u;
  __int16 v3 = *((_WORD *)a3 + 34);
  if ((v3 & 0x10) == 0)
  {
LABEL_7:
    if ((v3 & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_23;
  }
LABEL_22:
  self->_losPeakRatio = *((_DWORD *)a3 + 6);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v3 = *((_WORD *)a3 + 34);
  if ((v3 & 1) == 0)
  {
LABEL_8:
    if ((v3 & 0x400) == 0) {
      goto LABEL_9;
    }
    goto LABEL_24;
  }
LABEL_23:
  self->_bitErrorRate = *((_DWORD *)a3 + 2);
  *(_WORD *)&self->_has |= 1u;
  __int16 v3 = *((_WORD *)a3 + 34);
  if ((v3 & 0x400) == 0)
  {
LABEL_9:
    if ((v3 & 0x4000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_25;
  }
LABEL_24:
  self->_phyError = *((_DWORD *)a3 + 12);
  *(_WORD *)&self->_has |= 0x400u;
  __int16 v3 = *((_WORD *)a3 + 34);
  if ((v3 & 0x4000) == 0)
  {
LABEL_10:
    if ((v3 & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_26;
  }
LABEL_25:
  self->_status = *((_DWORD *)a3 + 16);
  *(_WORD *)&self->_has |= 0x4000u;
  __int16 v3 = *((_WORD *)a3 + 34);
  if ((v3 & 0x200) == 0)
  {
LABEL_11:
    if ((v3 & 0x80) == 0) {
      goto LABEL_12;
    }
    goto LABEL_27;
  }
LABEL_26:
  self->_peerSnr = *((_DWORD *)a3 + 11);
  *(_WORD *)&self->_has |= 0x200u;
  __int16 v3 = *((_WORD *)a3 + 34);
  if ((v3 & 0x80) == 0)
  {
LABEL_12:
    if ((v3 & 0x40) == 0) {
      goto LABEL_13;
    }
    goto LABEL_28;
  }
LABEL_27:
  self->_peerLosPeakRatio = *((_DWORD *)a3 + 9);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v3 = *((_WORD *)a3 + 34);
  if ((v3 & 0x40) == 0)
  {
LABEL_13:
    if ((v3 & 0x20) == 0) {
      goto LABEL_14;
    }
    goto LABEL_29;
  }
LABEL_28:
  self->_peerCoreId = *((_DWORD *)a3 + 8);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v3 = *((_WORD *)a3 + 34);
  if ((v3 & 0x20) == 0)
  {
LABEL_14:
    if ((v3 & 0x100) == 0) {
      goto LABEL_15;
    }
    goto LABEL_30;
  }
LABEL_29:
  self->_peerBitErrorRate = *((_DWORD *)a3 + 7);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v3 = *((_WORD *)a3 + 34);
  if ((v3 & 0x100) == 0)
  {
LABEL_15:
    if ((v3 & 2) == 0) {
      return;
    }
LABEL_31:
    self->_channel = *((_DWORD *)a3 + 3);
    *(_WORD *)&self->_has |= 2u;
    return;
  }
LABEL_30:
  self->_peerPhyError = *((_DWORD *)a3 + 10);
  *(_WORD *)&self->_has |= 0x100u;
  if ((*((_WORD *)a3 + 34) & 2) != 0) {
    goto LABEL_31;
  }
}

- (unsigned)flags
{
  return self->_flags;
}

- (unsigned)rtt
{
  return self->_rtt;
}

- (int)rssi
{
  return self->_rssi;
}

- (unsigned)snr
{
  return self->_snr;
}

- (unsigned)coreId
{
  return self->_coreId;
}

- (unsigned)losPeakRatio
{
  return self->_losPeakRatio;
}

- (unsigned)bitErrorRate
{
  return self->_bitErrorRate;
}

- (unsigned)phyError
{
  return self->_phyError;
}

- (unsigned)status
{
  return self->_status;
}

- (unsigned)peerSnr
{
  return self->_peerSnr;
}

- (unsigned)peerLosPeakRatio
{
  return self->_peerLosPeakRatio;
}

- (unsigned)peerCoreId
{
  return self->_peerCoreId;
}

- (unsigned)peerBitErrorRate
{
  return self->_peerBitErrorRate;
}

- (unsigned)peerPhyError
{
  return self->_peerPhyError;
}

- (unsigned)channel
{
  return self->_channel;
}

@end