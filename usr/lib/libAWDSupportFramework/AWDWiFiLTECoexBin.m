@interface AWDWiFiLTECoexBin
- (BOOL)hasCtsnotrxafterrts;
- (BOOL)hasRxframe;
- (BOOL)hasRxrtry;
- (BOOL)hasTxassocreq;
- (BOOL)hasTxassocrsp;
- (BOOL)hasTxdeauth;
- (BOOL)hasTxframe;
- (BOOL)hasTxnocts;
- (BOOL)hasTxreassocreq;
- (BOOL)hasTxreassocrsp;
- (BOOL)hasTxretrans;
- (BOOL)hasTxrts;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)ctsnotrxafterrts;
- (unint64_t)hash;
- (unint64_t)rxframe;
- (unint64_t)rxrtry;
- (unint64_t)txassocreq;
- (unint64_t)txassocrsp;
- (unint64_t)txdeauth;
- (unint64_t)txframe;
- (unint64_t)txnocts;
- (unint64_t)txreassocreq;
- (unint64_t)txreassocrsp;
- (unint64_t)txretrans;
- (unint64_t)txrts;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCtsnotrxafterrts:(unint64_t)a3;
- (void)setHasCtsnotrxafterrts:(BOOL)a3;
- (void)setHasRxframe:(BOOL)a3;
- (void)setHasRxrtry:(BOOL)a3;
- (void)setHasTxassocreq:(BOOL)a3;
- (void)setHasTxassocrsp:(BOOL)a3;
- (void)setHasTxdeauth:(BOOL)a3;
- (void)setHasTxframe:(BOOL)a3;
- (void)setHasTxnocts:(BOOL)a3;
- (void)setHasTxreassocreq:(BOOL)a3;
- (void)setHasTxreassocrsp:(BOOL)a3;
- (void)setHasTxretrans:(BOOL)a3;
- (void)setHasTxrts:(BOOL)a3;
- (void)setRxframe:(unint64_t)a3;
- (void)setRxrtry:(unint64_t)a3;
- (void)setTxassocreq:(unint64_t)a3;
- (void)setTxassocrsp:(unint64_t)a3;
- (void)setTxdeauth:(unint64_t)a3;
- (void)setTxframe:(unint64_t)a3;
- (void)setTxnocts:(unint64_t)a3;
- (void)setTxreassocreq:(unint64_t)a3;
- (void)setTxreassocrsp:(unint64_t)a3;
- (void)setTxretrans:(unint64_t)a3;
- (void)setTxrts:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDWiFiLTECoexBin

- (void)setRxframe:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_rxframe = a3;
}

- (void)setHasRxframe:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasRxframe
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setTxframe:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_txframe = a3;
}

- (void)setHasTxframe:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasTxframe
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setRxrtry:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_rxrtry = a3;
}

- (void)setHasRxrtry:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasRxrtry
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setTxretrans:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_txretrans = a3;
}

- (void)setHasTxretrans:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasTxretrans
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setTxnocts:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_txnocts = a3;
}

- (void)setHasTxnocts:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasTxnocts
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setTxrts:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_txrts = a3;
}

- (void)setHasTxrts:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasTxrts
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setTxdeauth:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_txdeauth = a3;
}

- (void)setHasTxdeauth:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasTxdeauth
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setTxassocreq:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_txassocreq = a3;
}

- (void)setHasTxassocreq:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasTxassocreq
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setTxassocrsp:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_txassocrsp = a3;
}

- (void)setHasTxassocrsp:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasTxassocrsp
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setTxreassocreq:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_txreassocreq = a3;
}

- (void)setHasTxreassocreq:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasTxreassocreq
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setTxreassocrsp:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_txreassocrsp = a3;
}

- (void)setHasTxreassocrsp:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasTxreassocrsp
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setCtsnotrxafterrts:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_ctsnotrxafterrts = a3;
}

- (void)setHasCtsnotrxafterrts:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasCtsnotrxafterrts
{
  return *(_WORD *)&self->_has & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiLTECoexBin;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWiFiLTECoexBin description](&v3, sel_description), -[AWDWiFiLTECoexBin dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_rxframe] forKey:@"rxframe"];
    __int16 has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_txframe] forKey:@"txframe"];
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x400) == 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
LABEL_17:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_rxrtry] forKey:@"rxrtry"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_19;
  }
LABEL_18:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_txretrans] forKey:@"txretrans"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x800) == 0) {
      goto LABEL_7;
    }
    goto LABEL_20;
  }
LABEL_19:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_txnocts] forKey:@"txnocts"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_21;
  }
LABEL_20:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_txrts] forKey:@"txrts"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_22;
  }
LABEL_21:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_txdeauth] forKey:@"txdeauth"];
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_23;
  }
LABEL_22:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_txassocreq] forKey:@"txassocreq"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_10:
    if ((has & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_24;
  }
LABEL_23:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_txassocrsp] forKey:@"txassocrsp"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_11:
    if ((has & 0x200) == 0) {
      goto LABEL_12;
    }
LABEL_25:
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_txreassocrsp] forKey:@"txreassocrsp"];
    if ((*(_WORD *)&self->_has & 1) == 0) {
      return v3;
    }
    goto LABEL_13;
  }
LABEL_24:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_txreassocreq] forKey:@"txreassocreq"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0) {
    goto LABEL_25;
  }
LABEL_12:
  if (has) {
LABEL_13:
  }
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_ctsnotrxafterrts] forKey:@"ctsnotrxafterrts"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiLTECoexBinReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    __int16 has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((has & 0x40) == 0)
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
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x800) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_10:
    if ((has & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_11:
    if ((has & 0x200) == 0) {
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
  if ((has & 0x200) != 0) {
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
  if ((has & 2) != 0)
  {
    *((void *)a3 + 2) = self->_rxframe;
    *((_WORD *)a3 + 52) |= 2u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  *((void *)a3 + 7) = self->_txframe;
  *((_WORD *)a3 + 52) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x400) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((void *)a3 + 3) = self->_rxrtry;
  *((_WORD *)a3 + 52) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  *((void *)a3 + 11) = self->_txretrans;
  *((_WORD *)a3 + 52) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x800) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((void *)a3 + 8) = self->_txnocts;
  *((_WORD *)a3 + 52) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((void *)a3 + 12) = self->_txrts;
  *((_WORD *)a3 + 52) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((void *)a3 + 6) = self->_txdeauth;
  *((_WORD *)a3 + 52) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((void *)a3 + 4) = self->_txassocreq;
  *((_WORD *)a3 + 52) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_10:
    if ((has & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((void *)a3 + 5) = self->_txassocrsp;
  *((_WORD *)a3 + 52) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_11:
    if ((has & 0x200) == 0) {
      goto LABEL_12;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((void *)a3 + 9) = self->_txreassocreq;
  *((_WORD *)a3 + 52) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_12:
    if ((has & 1) == 0) {
      return;
    }
LABEL_25:
    *((void *)a3 + 1) = self->_ctsnotrxafterrts;
    *((_WORD *)a3 + 52) |= 1u;
    return;
  }
LABEL_24:
  *((void *)a3 + 10) = self->_txreassocrsp;
  *((_WORD *)a3 + 52) |= 0x200u;
  if (*(_WORD *)&self->_has) {
    goto LABEL_25;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(id)[(id)[(id)objc_opt_class() allocWithZone:a3] init];
  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    *((void *)result + 2) = self->_rxframe;
    *((_WORD *)result + 52) |= 2u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  *((void *)result + 7) = self->_txframe;
  *((_WORD *)result + 52) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x400) == 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
LABEL_17:
  *((void *)result + 3) = self->_rxrtry;
  *((_WORD *)result + 52) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((void *)result + 11) = self->_txretrans;
  *((_WORD *)result + 52) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x800) == 0) {
      goto LABEL_7;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((void *)result + 8) = self->_txnocts;
  *((_WORD *)result + 52) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((void *)result + 12) = self->_txrts;
  *((_WORD *)result + 52) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((void *)result + 6) = self->_txdeauth;
  *((_WORD *)result + 52) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((void *)result + 4) = self->_txassocreq;
  *((_WORD *)result + 52) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_10:
    if ((has & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((void *)result + 5) = self->_txassocrsp;
  *((_WORD *)result + 52) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_11:
    if ((has & 0x200) == 0) {
      goto LABEL_12;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((void *)result + 9) = self->_txreassocreq;
  *((_WORD *)result + 52) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_12:
    if ((has & 1) == 0) {
      return result;
    }
    goto LABEL_13;
  }
LABEL_25:
  *((void *)result + 10) = self->_txreassocrsp;
  *((_WORD *)result + 52) |= 0x200u;
  if ((*(_WORD *)&self->_has & 1) == 0) {
    return result;
  }
LABEL_13:
  *((void *)result + 1) = self->_ctsnotrxafterrts;
  *((_WORD *)result + 52) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    __int16 has = (__int16)self->_has;
    __int16 v7 = *((_WORD *)a3 + 52);
    if ((has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_rxframe != *((void *)a3 + 2)) {
        goto LABEL_61;
      }
    }
    else if ((v7 & 2) != 0)
    {
LABEL_61:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((has & 0x40) != 0)
    {
      if ((v7 & 0x40) == 0 || self->_txframe != *((void *)a3 + 7)) {
        goto LABEL_61;
      }
    }
    else if ((v7 & 0x40) != 0)
    {
      goto LABEL_61;
    }
    if ((has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_rxrtry != *((void *)a3 + 3)) {
        goto LABEL_61;
      }
    }
    else if ((v7 & 4) != 0)
    {
      goto LABEL_61;
    }
    if ((*(_WORD *)&self->_has & 0x400) != 0)
    {
      if ((*((_WORD *)a3 + 52) & 0x400) == 0 || self->_txretrans != *((void *)a3 + 11)) {
        goto LABEL_61;
      }
    }
    else if ((*((_WORD *)a3 + 52) & 0x400) != 0)
    {
      goto LABEL_61;
    }
    if ((has & 0x80) != 0)
    {
      if ((v7 & 0x80) == 0 || self->_txnocts != *((void *)a3 + 8)) {
        goto LABEL_61;
      }
    }
    else if ((v7 & 0x80) != 0)
    {
      goto LABEL_61;
    }
    if ((*(_WORD *)&self->_has & 0x800) != 0)
    {
      if ((*((_WORD *)a3 + 52) & 0x800) == 0 || self->_txrts != *((void *)a3 + 12)) {
        goto LABEL_61;
      }
    }
    else if ((*((_WORD *)a3 + 52) & 0x800) != 0)
    {
      goto LABEL_61;
    }
    if ((has & 0x20) != 0)
    {
      if ((v7 & 0x20) == 0 || self->_txdeauth != *((void *)a3 + 6)) {
        goto LABEL_61;
      }
    }
    else if ((v7 & 0x20) != 0)
    {
      goto LABEL_61;
    }
    if ((has & 8) != 0)
    {
      if ((v7 & 8) == 0 || self->_txassocreq != *((void *)a3 + 4)) {
        goto LABEL_61;
      }
    }
    else if ((v7 & 8) != 0)
    {
      goto LABEL_61;
    }
    if ((has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_txassocrsp != *((void *)a3 + 5)) {
        goto LABEL_61;
      }
    }
    else if ((v7 & 0x10) != 0)
    {
      goto LABEL_61;
    }
    if ((*(_WORD *)&self->_has & 0x100) != 0)
    {
      if ((*((_WORD *)a3 + 52) & 0x100) == 0 || self->_txreassocreq != *((void *)a3 + 9)) {
        goto LABEL_61;
      }
    }
    else if ((*((_WORD *)a3 + 52) & 0x100) != 0)
    {
      goto LABEL_61;
    }
    if ((*(_WORD *)&self->_has & 0x200) != 0)
    {
      if ((*((_WORD *)a3 + 52) & 0x200) == 0 || self->_txreassocrsp != *((void *)a3 + 10)) {
        goto LABEL_61;
      }
    }
    else if ((*((_WORD *)a3 + 52) & 0x200) != 0)
    {
      goto LABEL_61;
    }
    LOBYTE(v5) = (v7 & 1) == 0;
    if (has)
    {
      if ((v7 & 1) == 0 || self->_ctsnotrxafterrts != *((void *)a3 + 1)) {
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
  if ((has & 2) != 0)
  {
    unint64_t v3 = 2654435761u * self->_rxframe;
    if ((has & 0x40) != 0)
    {
LABEL_3:
      unint64_t v4 = 2654435761u * self->_txframe;
      if ((has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else
  {
    unint64_t v3 = 0;
    if ((has & 0x40) != 0) {
      goto LABEL_3;
    }
  }
  unint64_t v4 = 0;
  if ((has & 4) != 0)
  {
LABEL_4:
    unint64_t v5 = 2654435761u * self->_rxrtry;
    if ((*(_WORD *)&self->_has & 0x400) != 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  unint64_t v5 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_5:
    unint64_t v6 = 2654435761u * self->_txretrans;
    if ((has & 0x80) != 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  unint64_t v6 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_6:
    unint64_t v7 = 2654435761u * self->_txnocts;
    if ((*(_WORD *)&self->_has & 0x800) != 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  unint64_t v7 = 0;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_7:
    unint64_t v8 = 2654435761u * self->_txrts;
    if ((has & 0x20) != 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  unint64_t v8 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_8:
    unint64_t v9 = 2654435761u * self->_txdeauth;
    if ((has & 8) != 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  unint64_t v9 = 0;
  if ((has & 8) != 0)
  {
LABEL_9:
    unint64_t v10 = 2654435761u * self->_txassocreq;
    if ((has & 0x10) != 0) {
      goto LABEL_10;
    }
    goto LABEL_22;
  }
LABEL_21:
  unint64_t v10 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_10:
    unint64_t v11 = 2654435761u * self->_txassocrsp;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_11;
    }
    goto LABEL_23;
  }
LABEL_22:
  unint64_t v11 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_11:
    unint64_t v12 = 2654435761u * self->_txreassocreq;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
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
  if ((*(_WORD *)&self->_has & 0x200) == 0) {
    goto LABEL_24;
  }
LABEL_12:
  unint64_t v13 = 2654435761u * self->_txreassocrsp;
  if ((has & 1) == 0) {
    goto LABEL_25;
  }
LABEL_13:
  unint64_t v14 = 2654435761u * self->_ctsnotrxafterrts;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14;
}

- (void)mergeFrom:(id)a3
{
  __int16 v3 = *((_WORD *)a3 + 52);
  if ((v3 & 2) != 0)
  {
    self->_rxframe = *((void *)a3 + 2);
    *(_WORD *)&self->_has |= 2u;
    __int16 v3 = *((_WORD *)a3 + 52);
    if ((v3 & 0x40) == 0)
    {
LABEL_3:
      if ((v3 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((v3 & 0x40) == 0)
  {
    goto LABEL_3;
  }
  self->_txframe = *((void *)a3 + 7);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v3 = *((_WORD *)a3 + 52);
  if ((v3 & 4) == 0)
  {
LABEL_4:
    if ((v3 & 0x400) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  self->_rxrtry = *((void *)a3 + 3);
  *(_WORD *)&self->_has |= 4u;
  __int16 v3 = *((_WORD *)a3 + 52);
  if ((v3 & 0x400) == 0)
  {
LABEL_5:
    if ((v3 & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  self->_txretrans = *((void *)a3 + 11);
  *(_WORD *)&self->_has |= 0x400u;
  __int16 v3 = *((_WORD *)a3 + 52);
  if ((v3 & 0x80) == 0)
  {
LABEL_6:
    if ((v3 & 0x800) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  self->_txnocts = *((void *)a3 + 8);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v3 = *((_WORD *)a3 + 52);
  if ((v3 & 0x800) == 0)
  {
LABEL_7:
    if ((v3 & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  self->_txrts = *((void *)a3 + 12);
  *(_WORD *)&self->_has |= 0x800u;
  __int16 v3 = *((_WORD *)a3 + 52);
  if ((v3 & 0x20) == 0)
  {
LABEL_8:
    if ((v3 & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  self->_txdeauth = *((void *)a3 + 6);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v3 = *((_WORD *)a3 + 52);
  if ((v3 & 8) == 0)
  {
LABEL_9:
    if ((v3 & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_22;
  }
LABEL_21:
  self->_txassocreq = *((void *)a3 + 4);
  *(_WORD *)&self->_has |= 8u;
  __int16 v3 = *((_WORD *)a3 + 52);
  if ((v3 & 0x10) == 0)
  {
LABEL_10:
    if ((v3 & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_23;
  }
LABEL_22:
  self->_txassocrsp = *((void *)a3 + 5);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v3 = *((_WORD *)a3 + 52);
  if ((v3 & 0x100) == 0)
  {
LABEL_11:
    if ((v3 & 0x200) == 0) {
      goto LABEL_12;
    }
    goto LABEL_24;
  }
LABEL_23:
  self->_txreassocreq = *((void *)a3 + 9);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v3 = *((_WORD *)a3 + 52);
  if ((v3 & 0x200) == 0)
  {
LABEL_12:
    if ((v3 & 1) == 0) {
      return;
    }
LABEL_25:
    self->_ctsnotrxafterrts = *((void *)a3 + 1);
    *(_WORD *)&self->_has |= 1u;
    return;
  }
LABEL_24:
  self->_txreassocrsp = *((void *)a3 + 10);
  *(_WORD *)&self->_has |= 0x200u;
  if (*((_WORD *)a3 + 52)) {
    goto LABEL_25;
  }
}

- (unint64_t)rxframe
{
  return self->_rxframe;
}

- (unint64_t)txframe
{
  return self->_txframe;
}

- (unint64_t)rxrtry
{
  return self->_rxrtry;
}

- (unint64_t)txretrans
{
  return self->_txretrans;
}

- (unint64_t)txnocts
{
  return self->_txnocts;
}

- (unint64_t)txrts
{
  return self->_txrts;
}

- (unint64_t)txdeauth
{
  return self->_txdeauth;
}

- (unint64_t)txassocreq
{
  return self->_txassocreq;
}

- (unint64_t)txassocrsp
{
  return self->_txassocrsp;
}

- (unint64_t)txreassocreq
{
  return self->_txreassocreq;
}

- (unint64_t)txreassocrsp
{
  return self->_txreassocrsp;
}

- (unint64_t)ctsnotrxafterrts
{
  return self->_ctsnotrxafterrts;
}

@end