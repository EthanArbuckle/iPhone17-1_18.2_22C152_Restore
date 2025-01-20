@interface AWDWiFiTDMSlice
- (BOOL)hasAckTxPowerBackoffCount;
- (BOOL)hasTxDeferDuration;
- (BOOL)hasTxDeferredCount;
- (BOOL)hasTxMuteCount;
- (BOOL)hasTxPathEnableReqCount;
- (BOOL)hasTxPathMuteCount;
- (BOOL)hasTxPriDuration;
- (BOOL)hasTxPriorityCount;
- (BOOL)hasTxaDuration;
- (BOOL)hasTxaONCount;
- (BOOL)hasTxaPORCount;
- (BOOL)hasTxaTimeoutCount;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)txDeferDuration;
- (unint64_t)txPriDuration;
- (unint64_t)txaDuration;
- (unsigned)ackTxPowerBackoffCount;
- (unsigned)txDeferredCount;
- (unsigned)txMuteCount;
- (unsigned)txPathEnableReqCount;
- (unsigned)txPathMuteCount;
- (unsigned)txPriorityCount;
- (unsigned)txaONCount;
- (unsigned)txaPORCount;
- (unsigned)txaTimeoutCount;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAckTxPowerBackoffCount:(unsigned int)a3;
- (void)setHasAckTxPowerBackoffCount:(BOOL)a3;
- (void)setHasTxDeferDuration:(BOOL)a3;
- (void)setHasTxDeferredCount:(BOOL)a3;
- (void)setHasTxMuteCount:(BOOL)a3;
- (void)setHasTxPathEnableReqCount:(BOOL)a3;
- (void)setHasTxPathMuteCount:(BOOL)a3;
- (void)setHasTxPriDuration:(BOOL)a3;
- (void)setHasTxPriorityCount:(BOOL)a3;
- (void)setHasTxaDuration:(BOOL)a3;
- (void)setHasTxaONCount:(BOOL)a3;
- (void)setHasTxaPORCount:(BOOL)a3;
- (void)setHasTxaTimeoutCount:(BOOL)a3;
- (void)setTxDeferDuration:(unint64_t)a3;
- (void)setTxDeferredCount:(unsigned int)a3;
- (void)setTxMuteCount:(unsigned int)a3;
- (void)setTxPathEnableReqCount:(unsigned int)a3;
- (void)setTxPathMuteCount:(unsigned int)a3;
- (void)setTxPriDuration:(unint64_t)a3;
- (void)setTxPriorityCount:(unsigned int)a3;
- (void)setTxaDuration:(unint64_t)a3;
- (void)setTxaONCount:(unsigned int)a3;
- (void)setTxaPORCount:(unsigned int)a3;
- (void)setTxaTimeoutCount:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDWiFiTDMSlice

- (void)setTxaONCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_txaONCount = a3;
}

- (void)setHasTxaONCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasTxaONCount
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setTxaTimeoutCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_txaTimeoutCount = a3;
}

- (void)setHasTxaTimeoutCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasTxaTimeoutCount
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setTxaPORCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_txaPORCount = a3;
}

- (void)setHasTxaPORCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasTxaPORCount
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setTxPathEnableReqCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_txPathEnableReqCount = a3;
}

- (void)setHasTxPathEnableReqCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasTxPathEnableReqCount
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setTxPathMuteCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_txPathMuteCount = a3;
}

- (void)setHasTxPathMuteCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasTxPathMuteCount
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setTxPriorityCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_txPriorityCount = a3;
}

- (void)setHasTxPriorityCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasTxPriorityCount
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setTxDeferredCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_txDeferredCount = a3;
}

- (void)setHasTxDeferredCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasTxDeferredCount
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setTxMuteCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_txMuteCount = a3;
}

- (void)setHasTxMuteCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasTxMuteCount
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setAckTxPowerBackoffCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_ackTxPowerBackoffCount = a3;
}

- (void)setHasAckTxPowerBackoffCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasAckTxPowerBackoffCount
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setTxaDuration:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_txaDuration = a3;
}

- (void)setHasTxaDuration:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasTxaDuration
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setTxPriDuration:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_txPriDuration = a3;
}

- (void)setHasTxPriDuration:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasTxPriDuration
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setTxDeferDuration:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_txDeferDuration = a3;
}

- (void)setHasTxDeferDuration:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasTxDeferDuration
{
  return *(_WORD *)&self->_has & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiTDMSlice;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWiFiTDMSlice description](&v3, sel_description), -[AWDWiFiTDMSlice dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_txaONCount] forKey:@"txaONCount"];
    __int16 has = (__int16)self->_has;
    if ((has & 0x800) == 0)
    {
LABEL_3:
      if ((has & 0x400) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_txaTimeoutCount] forKey:@"txaTimeoutCount"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
LABEL_17:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_txaPORCount] forKey:@"txaPORCount"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_19;
  }
LABEL_18:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_txPathEnableReqCount] forKey:@"txPathEnableReqCount"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_20;
  }
LABEL_19:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_txPathMuteCount] forKey:@"txPathMuteCount"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_21;
  }
LABEL_20:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_txPriorityCount] forKey:@"txPriorityCount"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_22;
  }
LABEL_21:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_txDeferredCount] forKey:@"txDeferredCount"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_23;
  }
LABEL_22:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_txMuteCount] forKey:@"txMuteCount"];
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_10:
    if ((has & 4) == 0) {
      goto LABEL_11;
    }
    goto LABEL_24;
  }
LABEL_23:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_ackTxPowerBackoffCount] forKey:@"ackTxPowerBackoffCount"];
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_11:
    if ((has & 2) == 0) {
      goto LABEL_12;
    }
LABEL_25:
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_txPriDuration] forKey:@"txPriDuration"];
    if ((*(_WORD *)&self->_has & 1) == 0) {
      return v3;
    }
    goto LABEL_13;
  }
LABEL_24:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_txaDuration] forKey:@"txaDuration"];
  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_25;
  }
LABEL_12:
  if (has) {
LABEL_13:
  }
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_txDeferDuration] forKey:@"txDeferDuration"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiTDMSliceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    PBDataWriterWriteUint32Field();
    __int16 has = (__int16)self->_has;
    if ((has & 0x800) == 0)
    {
LABEL_3:
      if ((has & 0x400) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
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
    if ((has & 4) == 0) {
      goto LABEL_11;
    }
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_11:
    if ((has & 2) == 0) {
      goto LABEL_12;
    }
LABEL_24:
    PBDataWriterWriteUint64Field();
    if ((*(_WORD *)&self->_has & 1) == 0) {
      return;
    }
    goto LABEL_25;
  }
LABEL_23:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_24;
  }
LABEL_12:
  if ((has & 1) == 0) {
    return;
  }
LABEL_25:

  PBDataWriterWriteUint64Field();
}

- (void)copyTo:(id)a3
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    *((_DWORD *)a3 + 14) = self->_txaONCount;
    *((_WORD *)a3 + 34) |= 0x200u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x800) == 0)
    {
LABEL_3:
      if ((has & 0x400) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 16) = self->_txaTimeoutCount;
  *((_WORD *)a3 + 34) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)a3 + 15) = self->_txaPORCount;
  *((_WORD *)a3 + 34) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)a3 + 11) = self->_txPathEnableReqCount;
  *((_WORD *)a3 + 34) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)a3 + 12) = self->_txPathMuteCount;
  *((_WORD *)a3 + 34) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)a3 + 13) = self->_txPriorityCount;
  *((_WORD *)a3 + 34) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)a3 + 9) = self->_txDeferredCount;
  *((_WORD *)a3 + 34) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)a3 + 10) = self->_txMuteCount;
  *((_WORD *)a3 + 34) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_10:
    if ((has & 4) == 0) {
      goto LABEL_11;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)a3 + 8) = self->_ackTxPowerBackoffCount;
  *((_WORD *)a3 + 34) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_11:
    if ((has & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((void *)a3 + 3) = self->_txaDuration;
  *((_WORD *)a3 + 34) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_12:
    if ((has & 1) == 0) {
      return;
    }
LABEL_25:
    *((void *)a3 + 1) = self->_txDeferDuration;
    *((_WORD *)a3 + 34) |= 1u;
    return;
  }
LABEL_24:
  *((void *)a3 + 2) = self->_txPriDuration;
  *((_WORD *)a3 + 34) |= 2u;
  if (*(_WORD *)&self->_has) {
    goto LABEL_25;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(id)[(id)objc_opt_class() allocWithZone:a3] init];
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    *((_DWORD *)result + 14) = self->_txaONCount;
    *((_WORD *)result + 34) |= 0x200u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x800) == 0)
    {
LABEL_3:
      if ((has & 0x400) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 16) = self->_txaTimeoutCount;
  *((_WORD *)result + 34) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)result + 15) = self->_txaPORCount;
  *((_WORD *)result + 34) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)result + 11) = self->_txPathEnableReqCount;
  *((_WORD *)result + 34) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)result + 12) = self->_txPathMuteCount;
  *((_WORD *)result + 34) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)result + 13) = self->_txPriorityCount;
  *((_WORD *)result + 34) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)result + 9) = self->_txDeferredCount;
  *((_WORD *)result + 34) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)result + 10) = self->_txMuteCount;
  *((_WORD *)result + 34) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_10:
    if ((has & 4) == 0) {
      goto LABEL_11;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)result + 8) = self->_ackTxPowerBackoffCount;
  *((_WORD *)result + 34) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_11:
    if ((has & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((void *)result + 3) = self->_txaDuration;
  *((_WORD *)result + 34) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_12:
    if ((has & 1) == 0) {
      return result;
    }
    goto LABEL_13;
  }
LABEL_25:
  *((void *)result + 2) = self->_txPriDuration;
  *((_WORD *)result + 34) |= 2u;
  if ((*(_WORD *)&self->_has & 1) == 0) {
    return result;
  }
LABEL_13:
  *((void *)result + 1) = self->_txDeferDuration;
  *((_WORD *)result + 34) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    __int16 has = (__int16)self->_has;
    __int16 v7 = *((_WORD *)a3 + 34);
    if ((has & 0x200) != 0)
    {
      if ((*((_WORD *)a3 + 34) & 0x200) == 0 || self->_txaONCount != *((_DWORD *)a3 + 14)) {
        goto LABEL_61;
      }
    }
    else if ((*((_WORD *)a3 + 34) & 0x200) != 0)
    {
LABEL_61:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_WORD *)&self->_has & 0x800) != 0)
    {
      if ((*((_WORD *)a3 + 34) & 0x800) == 0 || self->_txaTimeoutCount != *((_DWORD *)a3 + 16)) {
        goto LABEL_61;
      }
    }
    else if ((*((_WORD *)a3 + 34) & 0x800) != 0)
    {
      goto LABEL_61;
    }
    if ((*(_WORD *)&self->_has & 0x400) != 0)
    {
      if ((*((_WORD *)a3 + 34) & 0x400) == 0 || self->_txaPORCount != *((_DWORD *)a3 + 15)) {
        goto LABEL_61;
      }
    }
    else if ((*((_WORD *)a3 + 34) & 0x400) != 0)
    {
      goto LABEL_61;
    }
    if ((has & 0x40) != 0)
    {
      if ((v7 & 0x40) == 0 || self->_txPathEnableReqCount != *((_DWORD *)a3 + 11)) {
        goto LABEL_61;
      }
    }
    else if ((v7 & 0x40) != 0)
    {
      goto LABEL_61;
    }
    if ((has & 0x80) != 0)
    {
      if ((v7 & 0x80) == 0 || self->_txPathMuteCount != *((_DWORD *)a3 + 12)) {
        goto LABEL_61;
      }
    }
    else if ((v7 & 0x80) != 0)
    {
      goto LABEL_61;
    }
    if ((*(_WORD *)&self->_has & 0x100) != 0)
    {
      if ((*((_WORD *)a3 + 34) & 0x100) == 0 || self->_txPriorityCount != *((_DWORD *)a3 + 13)) {
        goto LABEL_61;
      }
    }
    else if ((*((_WORD *)a3 + 34) & 0x100) != 0)
    {
      goto LABEL_61;
    }
    if ((has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_txDeferredCount != *((_DWORD *)a3 + 9)) {
        goto LABEL_61;
      }
    }
    else if ((v7 & 0x10) != 0)
    {
      goto LABEL_61;
    }
    if ((has & 0x20) != 0)
    {
      if ((v7 & 0x20) == 0 || self->_txMuteCount != *((_DWORD *)a3 + 10)) {
        goto LABEL_61;
      }
    }
    else if ((v7 & 0x20) != 0)
    {
      goto LABEL_61;
    }
    if ((has & 8) != 0)
    {
      if ((v7 & 8) == 0 || self->_ackTxPowerBackoffCount != *((_DWORD *)a3 + 8)) {
        goto LABEL_61;
      }
    }
    else if ((v7 & 8) != 0)
    {
      goto LABEL_61;
    }
    if ((has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_txaDuration != *((void *)a3 + 3)) {
        goto LABEL_61;
      }
    }
    else if ((v7 & 4) != 0)
    {
      goto LABEL_61;
    }
    if ((has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_txPriDuration != *((void *)a3 + 2)) {
        goto LABEL_61;
      }
    }
    else if ((v7 & 2) != 0)
    {
      goto LABEL_61;
    }
    LOBYTE(v5) = (v7 & 1) == 0;
    if (has)
    {
      if ((v7 & 1) == 0 || self->_txDeferDuration != *((void *)a3 + 1)) {
        goto LABEL_61;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    uint64_t v3 = 2654435761 * self->_txaONCount;
    if ((*(_WORD *)&self->_has & 0x800) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_txaTimeoutCount;
      if ((*(_WORD *)&self->_has & 0x400) != 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(_WORD *)&self->_has & 0x800) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_txaPORCount;
    if ((has & 0x40) != 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v5 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_txPathEnableReqCount;
    if ((has & 0x80) != 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v6 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_6:
    uint64_t v7 = 2654435761 * self->_txPathMuteCount;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v7 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_7:
    uint64_t v8 = 2654435761 * self->_txPriorityCount;
    if ((has & 0x10) != 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  uint64_t v8 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_8:
    uint64_t v9 = 2654435761 * self->_txDeferredCount;
    if ((has & 0x20) != 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v9 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_9:
    uint64_t v10 = 2654435761 * self->_txMuteCount;
    if ((has & 8) != 0) {
      goto LABEL_10;
    }
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v10 = 0;
  if ((has & 8) != 0)
  {
LABEL_10:
    uint64_t v11 = 2654435761 * self->_ackTxPowerBackoffCount;
    if ((has & 4) != 0) {
      goto LABEL_11;
    }
    goto LABEL_23;
  }
LABEL_22:
  uint64_t v11 = 0;
  if ((has & 4) != 0)
  {
LABEL_11:
    unint64_t v12 = 2654435761u * self->_txaDuration;
    if ((has & 2) != 0) {
      goto LABEL_12;
    }
LABEL_24:
    unint64_t v13 = 0;
    if (has) {
      goto LABEL_13;
    }
LABEL_25:
    unint64_t v14 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14;
  }
LABEL_23:
  unint64_t v12 = 0;
  if ((has & 2) == 0) {
    goto LABEL_24;
  }
LABEL_12:
  unint64_t v13 = 2654435761u * self->_txPriDuration;
  if ((has & 1) == 0) {
    goto LABEL_25;
  }
LABEL_13:
  unint64_t v14 = 2654435761u * self->_txDeferDuration;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14;
}

- (void)mergeFrom:(id)a3
{
  __int16 v3 = *((_WORD *)a3 + 34);
  if ((v3 & 0x200) != 0)
  {
    self->_txaONCount = *((_DWORD *)a3 + 14);
    *(_WORD *)&self->_has |= 0x200u;
    __int16 v3 = *((_WORD *)a3 + 34);
    if ((v3 & 0x800) == 0)
    {
LABEL_3:
      if ((v3 & 0x400) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((*((_WORD *)a3 + 34) & 0x800) == 0)
  {
    goto LABEL_3;
  }
  self->_txaTimeoutCount = *((_DWORD *)a3 + 16);
  *(_WORD *)&self->_has |= 0x800u;
  __int16 v3 = *((_WORD *)a3 + 34);
  if ((v3 & 0x400) == 0)
  {
LABEL_4:
    if ((v3 & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  self->_txaPORCount = *((_DWORD *)a3 + 15);
  *(_WORD *)&self->_has |= 0x400u;
  __int16 v3 = *((_WORD *)a3 + 34);
  if ((v3 & 0x40) == 0)
  {
LABEL_5:
    if ((v3 & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  self->_txPathEnableReqCount = *((_DWORD *)a3 + 11);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v3 = *((_WORD *)a3 + 34);
  if ((v3 & 0x80) == 0)
  {
LABEL_6:
    if ((v3 & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  self->_txPathMuteCount = *((_DWORD *)a3 + 12);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v3 = *((_WORD *)a3 + 34);
  if ((v3 & 0x100) == 0)
  {
LABEL_7:
    if ((v3 & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  self->_txPriorityCount = *((_DWORD *)a3 + 13);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v3 = *((_WORD *)a3 + 34);
  if ((v3 & 0x10) == 0)
  {
LABEL_8:
    if ((v3 & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  self->_txDeferredCount = *((_DWORD *)a3 + 9);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v3 = *((_WORD *)a3 + 34);
  if ((v3 & 0x20) == 0)
  {
LABEL_9:
    if ((v3 & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_22;
  }
LABEL_21:
  self->_txMuteCount = *((_DWORD *)a3 + 10);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v3 = *((_WORD *)a3 + 34);
  if ((v3 & 8) == 0)
  {
LABEL_10:
    if ((v3 & 4) == 0) {
      goto LABEL_11;
    }
    goto LABEL_23;
  }
LABEL_22:
  self->_ackTxPowerBackoffCount = *((_DWORD *)a3 + 8);
  *(_WORD *)&self->_has |= 8u;
  __int16 v3 = *((_WORD *)a3 + 34);
  if ((v3 & 4) == 0)
  {
LABEL_11:
    if ((v3 & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_24;
  }
LABEL_23:
  self->_txaDuration = *((void *)a3 + 3);
  *(_WORD *)&self->_has |= 4u;
  __int16 v3 = *((_WORD *)a3 + 34);
  if ((v3 & 2) == 0)
  {
LABEL_12:
    if ((v3 & 1) == 0) {
      return;
    }
LABEL_25:
    self->_txDeferDuration = *((void *)a3 + 1);
    *(_WORD *)&self->_has |= 1u;
    return;
  }
LABEL_24:
  self->_txPriDuration = *((void *)a3 + 2);
  *(_WORD *)&self->_has |= 2u;
  if (*((_WORD *)a3 + 34)) {
    goto LABEL_25;
  }
}

- (unsigned)txaONCount
{
  return self->_txaONCount;
}

- (unsigned)txaTimeoutCount
{
  return self->_txaTimeoutCount;
}

- (unsigned)txaPORCount
{
  return self->_txaPORCount;
}

- (unsigned)txPathEnableReqCount
{
  return self->_txPathEnableReqCount;
}

- (unsigned)txPathMuteCount
{
  return self->_txPathMuteCount;
}

- (unsigned)txPriorityCount
{
  return self->_txPriorityCount;
}

- (unsigned)txDeferredCount
{
  return self->_txDeferredCount;
}

- (unsigned)txMuteCount
{
  return self->_txMuteCount;
}

- (unsigned)ackTxPowerBackoffCount
{
  return self->_ackTxPowerBackoffCount;
}

- (unint64_t)txaDuration
{
  return self->_txaDuration;
}

- (unint64_t)txPriDuration
{
  return self->_txPriDuration;
}

- (unint64_t)txDeferDuration
{
  return self->_txDeferDuration;
}

@end