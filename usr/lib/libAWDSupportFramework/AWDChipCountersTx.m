@interface AWDChipCountersTx
- (BOOL)hasTxbyte;
- (BOOL)hasTxchit;
- (BOOL)hasTxcmiss;
- (BOOL)hasTxctl;
- (BOOL)hasTxerror;
- (BOOL)hasTxframe;
- (BOOL)hasTxnoassoc;
- (BOOL)hasTxnobuf;
- (BOOL)hasTxprshort;
- (BOOL)hasTxretrans;
- (BOOL)hasTxrunt;
- (BOOL)hasTxserr;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)txbyte;
- (unint64_t)txchit;
- (unint64_t)txcmiss;
- (unint64_t)txctl;
- (unint64_t)txerror;
- (unint64_t)txframe;
- (unint64_t)txnoassoc;
- (unint64_t)txnobuf;
- (unint64_t)txprshort;
- (unint64_t)txretrans;
- (unint64_t)txrunt;
- (unint64_t)txserr;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasTxbyte:(BOOL)a3;
- (void)setHasTxchit:(BOOL)a3;
- (void)setHasTxcmiss:(BOOL)a3;
- (void)setHasTxctl:(BOOL)a3;
- (void)setHasTxerror:(BOOL)a3;
- (void)setHasTxframe:(BOOL)a3;
- (void)setHasTxnoassoc:(BOOL)a3;
- (void)setHasTxnobuf:(BOOL)a3;
- (void)setHasTxprshort:(BOOL)a3;
- (void)setHasTxretrans:(BOOL)a3;
- (void)setHasTxrunt:(BOOL)a3;
- (void)setHasTxserr:(BOOL)a3;
- (void)setTxbyte:(unint64_t)a3;
- (void)setTxchit:(unint64_t)a3;
- (void)setTxcmiss:(unint64_t)a3;
- (void)setTxctl:(unint64_t)a3;
- (void)setTxerror:(unint64_t)a3;
- (void)setTxframe:(unint64_t)a3;
- (void)setTxnoassoc:(unint64_t)a3;
- (void)setTxnobuf:(unint64_t)a3;
- (void)setTxprshort:(unint64_t)a3;
- (void)setTxretrans:(unint64_t)a3;
- (void)setTxrunt:(unint64_t)a3;
- (void)setTxserr:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDChipCountersTx

- (void)setTxframe:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_txframe = a3;
}

- (void)setHasTxframe:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasTxframe
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setTxbyte:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_txbyte = a3;
}

- (void)setHasTxbyte:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasTxbyte
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setTxretrans:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_txretrans = a3;
}

- (void)setHasTxretrans:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasTxretrans
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setTxerror:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_txerror = a3;
}

- (void)setHasTxerror:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasTxerror
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setTxctl:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_txctl = a3;
}

- (void)setHasTxctl:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasTxctl
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setTxprshort:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_txprshort = a3;
}

- (void)setHasTxprshort:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasTxprshort
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setTxserr:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_txserr = a3;
}

- (void)setHasTxserr:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasTxserr
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setTxnobuf:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_txnobuf = a3;
}

- (void)setHasTxnobuf:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasTxnobuf
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setTxnoassoc:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_txnoassoc = a3;
}

- (void)setHasTxnoassoc:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasTxnoassoc
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setTxrunt:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_txrunt = a3;
}

- (void)setHasTxrunt:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasTxrunt
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setTxchit:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_txchit = a3;
}

- (void)setHasTxchit:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasTxchit
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setTxcmiss:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_txcmiss = a3;
}

- (void)setHasTxcmiss:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasTxcmiss
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDChipCountersTx;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDChipCountersTx description](&v3, sel_description), -[AWDChipCountersTx dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_txframe] forKey:@"txframe"];
    __int16 has = (__int16)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 0x200) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else if ((has & 1) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_txbyte] forKey:@"txbyte"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
LABEL_17:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_txretrans] forKey:@"txretrans"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_19;
  }
LABEL_18:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_txerror] forKey:@"txerror"];
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_20;
  }
LABEL_19:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_txctl] forKey:@"txctl"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 0x800) == 0) {
      goto LABEL_8;
    }
    goto LABEL_21;
  }
LABEL_20:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_txprshort] forKey:@"txprshort"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_22;
  }
LABEL_21:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_txserr] forKey:@"txserr"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x40) == 0) {
      goto LABEL_10;
    }
    goto LABEL_23;
  }
LABEL_22:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_txnobuf] forKey:@"txnobuf"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_10:
    if ((has & 0x400) == 0) {
      goto LABEL_11;
    }
    goto LABEL_24;
  }
LABEL_23:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_txnoassoc] forKey:@"txnoassoc"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_11:
    if ((has & 2) == 0) {
      goto LABEL_12;
    }
LABEL_25:
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_txchit] forKey:@"txchit"];
    if ((*(_WORD *)&self->_has & 4) == 0) {
      return v3;
    }
    goto LABEL_13;
  }
LABEL_24:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_txrunt] forKey:@"txrunt"];
  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_25;
  }
LABEL_12:
  if ((has & 4) != 0) {
LABEL_13:
  }
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_txcmiss] forKey:@"txcmiss"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDChipCountersTxReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) != 0)
  {
    PBDataWriterWriteUint64Field();
    __int16 has = (__int16)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 0x200) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 0x800) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x40) == 0) {
      goto LABEL_10;
    }
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_10:
    if ((has & 0x400) == 0) {
      goto LABEL_11;
    }
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_11:
    if ((has & 2) == 0) {
      goto LABEL_12;
    }
LABEL_24:
    PBDataWriterWriteUint64Field();
    if ((*(_WORD *)&self->_has & 4) == 0) {
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
  if ((has & 4) == 0) {
    return;
  }
LABEL_25:

  PBDataWriterWriteUint64Field();
}

- (void)copyTo:(id)a3
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) != 0)
  {
    *((void *)a3 + 6) = self->_txframe;
    *((_WORD *)a3 + 52) |= 0x20u;
    __int16 has = (__int16)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 0x200) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((void *)a3 + 1) = self->_txbyte;
  *((_WORD *)a3 + 52) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((void *)a3 + 10) = self->_txretrans;
  *((_WORD *)a3 + 52) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  *((void *)a3 + 5) = self->_txerror;
  *((_WORD *)a3 + 52) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((void *)a3 + 4) = self->_txctl;
  *((_WORD *)a3 + 52) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 0x800) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((void *)a3 + 9) = self->_txprshort;
  *((_WORD *)a3 + 52) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((void *)a3 + 12) = self->_txserr;
  *((_WORD *)a3 + 52) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x40) == 0) {
      goto LABEL_10;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((void *)a3 + 8) = self->_txnobuf;
  *((_WORD *)a3 + 52) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_10:
    if ((has & 0x400) == 0) {
      goto LABEL_11;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((void *)a3 + 7) = self->_txnoassoc;
  *((_WORD *)a3 + 52) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_11:
    if ((has & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((void *)a3 + 11) = self->_txrunt;
  *((_WORD *)a3 + 52) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_12:
    if ((has & 4) == 0) {
      return;
    }
LABEL_25:
    *((void *)a3 + 3) = self->_txcmiss;
    *((_WORD *)a3 + 52) |= 4u;
    return;
  }
LABEL_24:
  *((void *)a3 + 2) = self->_txchit;
  *((_WORD *)a3 + 52) |= 2u;
  if ((*(_WORD *)&self->_has & 4) != 0) {
    goto LABEL_25;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(id)[(id)objc_opt_class() allocWithZone:a3] init];
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) != 0)
  {
    *((void *)result + 6) = self->_txframe;
    *((_WORD *)result + 52) |= 0x20u;
    __int16 has = (__int16)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 0x200) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else if ((has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((void *)result + 1) = self->_txbyte;
  *((_WORD *)result + 52) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
LABEL_17:
  *((void *)result + 10) = self->_txretrans;
  *((_WORD *)result + 52) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((void *)result + 5) = self->_txerror;
  *((_WORD *)result + 52) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((void *)result + 4) = self->_txctl;
  *((_WORD *)result + 52) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 0x800) == 0) {
      goto LABEL_8;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((void *)result + 9) = self->_txprshort;
  *((_WORD *)result + 52) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((void *)result + 12) = self->_txserr;
  *((_WORD *)result + 52) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x40) == 0) {
      goto LABEL_10;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((void *)result + 8) = self->_txnobuf;
  *((_WORD *)result + 52) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_10:
    if ((has & 0x400) == 0) {
      goto LABEL_11;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((void *)result + 7) = self->_txnoassoc;
  *((_WORD *)result + 52) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_11:
    if ((has & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((void *)result + 11) = self->_txrunt;
  *((_WORD *)result + 52) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_12:
    if ((has & 4) == 0) {
      return result;
    }
    goto LABEL_13;
  }
LABEL_25:
  *((void *)result + 2) = self->_txchit;
  *((_WORD *)result + 52) |= 2u;
  if ((*(_WORD *)&self->_has & 4) == 0) {
    return result;
  }
LABEL_13:
  *((void *)result + 3) = self->_txcmiss;
  *((_WORD *)result + 52) |= 4u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    __int16 has = (__int16)self->_has;
    __int16 v7 = *((_WORD *)a3 + 52);
    if ((has & 0x20) != 0)
    {
      if ((v7 & 0x20) == 0 || self->_txframe != *((void *)a3 + 6)) {
        goto LABEL_61;
      }
    }
    else if ((v7 & 0x20) != 0)
    {
LABEL_61:
      LOBYTE(v5) = 0;
      return v5;
    }
    if (has)
    {
      if ((v7 & 1) == 0 || self->_txbyte != *((void *)a3 + 1)) {
        goto LABEL_61;
      }
    }
    else if (v7)
    {
      goto LABEL_61;
    }
    if ((*(_WORD *)&self->_has & 0x200) != 0)
    {
      if ((*((_WORD *)a3 + 52) & 0x200) == 0 || self->_txretrans != *((void *)a3 + 10)) {
        goto LABEL_61;
      }
    }
    else if ((*((_WORD *)a3 + 52) & 0x200) != 0)
    {
      goto LABEL_61;
    }
    if ((has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_txerror != *((void *)a3 + 5)) {
        goto LABEL_61;
      }
    }
    else if ((v7 & 0x10) != 0)
    {
      goto LABEL_61;
    }
    if ((has & 8) != 0)
    {
      if ((v7 & 8) == 0 || self->_txctl != *((void *)a3 + 4)) {
        goto LABEL_61;
      }
    }
    else if ((v7 & 8) != 0)
    {
      goto LABEL_61;
    }
    if ((*(_WORD *)&self->_has & 0x100) != 0)
    {
      if ((*((_WORD *)a3 + 52) & 0x100) == 0 || self->_txprshort != *((void *)a3 + 9)) {
        goto LABEL_61;
      }
    }
    else if ((*((_WORD *)a3 + 52) & 0x100) != 0)
    {
      goto LABEL_61;
    }
    if ((*(_WORD *)&self->_has & 0x800) != 0)
    {
      if ((*((_WORD *)a3 + 52) & 0x800) == 0 || self->_txserr != *((void *)a3 + 12)) {
        goto LABEL_61;
      }
    }
    else if ((*((_WORD *)a3 + 52) & 0x800) != 0)
    {
      goto LABEL_61;
    }
    if ((has & 0x80) != 0)
    {
      if ((v7 & 0x80) == 0 || self->_txnobuf != *((void *)a3 + 8)) {
        goto LABEL_61;
      }
    }
    else if ((v7 & 0x80) != 0)
    {
      goto LABEL_61;
    }
    if ((has & 0x40) != 0)
    {
      if ((v7 & 0x40) == 0 || self->_txnoassoc != *((void *)a3 + 7)) {
        goto LABEL_61;
      }
    }
    else if ((v7 & 0x40) != 0)
    {
      goto LABEL_61;
    }
    if ((*(_WORD *)&self->_has & 0x400) != 0)
    {
      if ((*((_WORD *)a3 + 52) & 0x400) == 0 || self->_txrunt != *((void *)a3 + 11)) {
        goto LABEL_61;
      }
    }
    else if ((*((_WORD *)a3 + 52) & 0x400) != 0)
    {
      goto LABEL_61;
    }
    if ((has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_txchit != *((void *)a3 + 2)) {
        goto LABEL_61;
      }
    }
    else if ((v7 & 2) != 0)
    {
      goto LABEL_61;
    }
    LOBYTE(v5) = (v7 & 4) == 0;
    if ((has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_txcmiss != *((void *)a3 + 3)) {
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
  if ((has & 0x20) != 0)
  {
    unint64_t v3 = 2654435761u * self->_txframe;
    if (has)
    {
LABEL_3:
      unint64_t v4 = 2654435761u * self->_txbyte;
      if ((*(_WORD *)&self->_has & 0x200) != 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else
  {
    unint64_t v3 = 0;
    if (has) {
      goto LABEL_3;
    }
  }
  unint64_t v4 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_4:
    unint64_t v5 = 2654435761u * self->_txretrans;
    if ((has & 0x10) != 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  unint64_t v5 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_5:
    unint64_t v6 = 2654435761u * self->_txerror;
    if ((has & 8) != 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  unint64_t v6 = 0;
  if ((has & 8) != 0)
  {
LABEL_6:
    unint64_t v7 = 2654435761u * self->_txctl;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  unint64_t v7 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_7:
    unint64_t v8 = 2654435761u * self->_txprshort;
    if ((*(_WORD *)&self->_has & 0x800) != 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  unint64_t v8 = 0;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_8:
    unint64_t v9 = 2654435761u * self->_txserr;
    if ((has & 0x80) != 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  unint64_t v9 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_9:
    unint64_t v10 = 2654435761u * self->_txnobuf;
    if ((has & 0x40) != 0) {
      goto LABEL_10;
    }
    goto LABEL_22;
  }
LABEL_21:
  unint64_t v10 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_10:
    unint64_t v11 = 2654435761u * self->_txnoassoc;
    if ((*(_WORD *)&self->_has & 0x400) != 0) {
      goto LABEL_11;
    }
    goto LABEL_23;
  }
LABEL_22:
  unint64_t v11 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_11:
    unint64_t v12 = 2654435761u * self->_txrunt;
    if ((has & 2) != 0) {
      goto LABEL_12;
    }
LABEL_24:
    unint64_t v13 = 0;
    if ((has & 4) != 0) {
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
  unint64_t v13 = 2654435761u * self->_txchit;
  if ((has & 4) == 0) {
    goto LABEL_25;
  }
LABEL_13:
  unint64_t v14 = 2654435761u * self->_txcmiss;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14;
}

- (void)mergeFrom:(id)a3
{
  __int16 v3 = *((_WORD *)a3 + 52);
  if ((v3 & 0x20) != 0)
  {
    self->_txframe = *((void *)a3 + 6);
    *(_WORD *)&self->_has |= 0x20u;
    __int16 v3 = *((_WORD *)a3 + 52);
    if ((v3 & 1) == 0)
    {
LABEL_3:
      if ((v3 & 0x200) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((v3 & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_txbyte = *((void *)a3 + 1);
  *(_WORD *)&self->_has |= 1u;
  __int16 v3 = *((_WORD *)a3 + 52);
  if ((v3 & 0x200) == 0)
  {
LABEL_4:
    if ((v3 & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  self->_txretrans = *((void *)a3 + 10);
  *(_WORD *)&self->_has |= 0x200u;
  __int16 v3 = *((_WORD *)a3 + 52);
  if ((v3 & 0x10) == 0)
  {
LABEL_5:
    if ((v3 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  self->_txerror = *((void *)a3 + 5);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v3 = *((_WORD *)a3 + 52);
  if ((v3 & 8) == 0)
  {
LABEL_6:
    if ((v3 & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  self->_txctl = *((void *)a3 + 4);
  *(_WORD *)&self->_has |= 8u;
  __int16 v3 = *((_WORD *)a3 + 52);
  if ((v3 & 0x100) == 0)
  {
LABEL_7:
    if ((v3 & 0x800) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  self->_txprshort = *((void *)a3 + 9);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v3 = *((_WORD *)a3 + 52);
  if ((v3 & 0x800) == 0)
  {
LABEL_8:
    if ((v3 & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  self->_txserr = *((void *)a3 + 12);
  *(_WORD *)&self->_has |= 0x800u;
  __int16 v3 = *((_WORD *)a3 + 52);
  if ((v3 & 0x80) == 0)
  {
LABEL_9:
    if ((v3 & 0x40) == 0) {
      goto LABEL_10;
    }
    goto LABEL_22;
  }
LABEL_21:
  self->_txnobuf = *((void *)a3 + 8);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v3 = *((_WORD *)a3 + 52);
  if ((v3 & 0x40) == 0)
  {
LABEL_10:
    if ((v3 & 0x400) == 0) {
      goto LABEL_11;
    }
    goto LABEL_23;
  }
LABEL_22:
  self->_txnoassoc = *((void *)a3 + 7);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v3 = *((_WORD *)a3 + 52);
  if ((v3 & 0x400) == 0)
  {
LABEL_11:
    if ((v3 & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_24;
  }
LABEL_23:
  self->_txrunt = *((void *)a3 + 11);
  *(_WORD *)&self->_has |= 0x400u;
  __int16 v3 = *((_WORD *)a3 + 52);
  if ((v3 & 2) == 0)
  {
LABEL_12:
    if ((v3 & 4) == 0) {
      return;
    }
LABEL_25:
    self->_txcmiss = *((void *)a3 + 3);
    *(_WORD *)&self->_has |= 4u;
    return;
  }
LABEL_24:
  self->_txchit = *((void *)a3 + 2);
  *(_WORD *)&self->_has |= 2u;
  if ((*((_WORD *)a3 + 52) & 4) != 0) {
    goto LABEL_25;
  }
}

- (unint64_t)txframe
{
  return self->_txframe;
}

- (unint64_t)txbyte
{
  return self->_txbyte;
}

- (unint64_t)txretrans
{
  return self->_txretrans;
}

- (unint64_t)txerror
{
  return self->_txerror;
}

- (unint64_t)txctl
{
  return self->_txctl;
}

- (unint64_t)txprshort
{
  return self->_txprshort;
}

- (unint64_t)txserr
{
  return self->_txserr;
}

- (unint64_t)txnobuf
{
  return self->_txnobuf;
}

- (unint64_t)txnoassoc
{
  return self->_txnoassoc;
}

- (unint64_t)txrunt
{
  return self->_txrunt;
}

- (unint64_t)txchit
{
  return self->_txchit;
}

- (unint64_t)txcmiss
{
  return self->_txcmiss;
}

@end