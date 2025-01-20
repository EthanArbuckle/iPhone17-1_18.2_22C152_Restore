@interface AWDOMICntrs
- (BOOL)hasHeOmitxDlmursdrec;
- (BOOL)hasHeOmitxDlmursdrecAck;
- (BOOL)hasHeOmitxDur;
- (BOOL)hasHeOmitxRetries;
- (BOOL)hasHeOmitxSched;
- (BOOL)hasHeOmitxSuccess;
- (BOOL)hasHeOmitxTxnsts;
- (BOOL)hasHeOmitxTxnstsAck;
- (BOOL)hasHeOmitxUlmucfg;
- (BOOL)hasHeOmitxUlmucfgAck;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)heOmitxDlmursdrec;
- (unsigned)heOmitxDlmursdrecAck;
- (unsigned)heOmitxDur;
- (unsigned)heOmitxRetries;
- (unsigned)heOmitxSched;
- (unsigned)heOmitxSuccess;
- (unsigned)heOmitxTxnsts;
- (unsigned)heOmitxTxnstsAck;
- (unsigned)heOmitxUlmucfg;
- (unsigned)heOmitxUlmucfgAck;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasHeOmitxDlmursdrec:(BOOL)a3;
- (void)setHasHeOmitxDlmursdrecAck:(BOOL)a3;
- (void)setHasHeOmitxDur:(BOOL)a3;
- (void)setHasHeOmitxRetries:(BOOL)a3;
- (void)setHasHeOmitxSched:(BOOL)a3;
- (void)setHasHeOmitxSuccess:(BOOL)a3;
- (void)setHasHeOmitxTxnsts:(BOOL)a3;
- (void)setHasHeOmitxTxnstsAck:(BOOL)a3;
- (void)setHasHeOmitxUlmucfg:(BOOL)a3;
- (void)setHasHeOmitxUlmucfgAck:(BOOL)a3;
- (void)setHeOmitxDlmursdrec:(unsigned int)a3;
- (void)setHeOmitxDlmursdrecAck:(unsigned int)a3;
- (void)setHeOmitxDur:(unsigned int)a3;
- (void)setHeOmitxRetries:(unsigned int)a3;
- (void)setHeOmitxSched:(unsigned int)a3;
- (void)setHeOmitxSuccess:(unsigned int)a3;
- (void)setHeOmitxTxnsts:(unsigned int)a3;
- (void)setHeOmitxTxnstsAck:(unsigned int)a3;
- (void)setHeOmitxUlmucfg:(unsigned int)a3;
- (void)setHeOmitxUlmucfgAck:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDOMICntrs

- (void)setHeOmitxSched:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_heOmitxSched = a3;
}

- (void)setHasHeOmitxSched:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasHeOmitxSched
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setHeOmitxSuccess:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_heOmitxSuccess = a3;
}

- (void)setHasHeOmitxSuccess:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasHeOmitxSuccess
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setHeOmitxRetries:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_heOmitxRetries = a3;
}

- (void)setHasHeOmitxRetries:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasHeOmitxRetries
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setHeOmitxDur:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_heOmitxDur = a3;
}

- (void)setHasHeOmitxDur:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasHeOmitxDur
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setHeOmitxUlmucfg:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_heOmitxUlmucfg = a3;
}

- (void)setHasHeOmitxUlmucfg:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasHeOmitxUlmucfg
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setHeOmitxUlmucfgAck:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_heOmitxUlmucfgAck = a3;
}

- (void)setHasHeOmitxUlmucfgAck:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasHeOmitxUlmucfgAck
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setHeOmitxTxnsts:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_heOmitxTxnsts = a3;
}

- (void)setHasHeOmitxTxnsts:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasHeOmitxTxnsts
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setHeOmitxTxnstsAck:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_heOmitxTxnstsAck = a3;
}

- (void)setHasHeOmitxTxnstsAck:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasHeOmitxTxnstsAck
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setHeOmitxDlmursdrec:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_heOmitxDlmursdrec = a3;
}

- (void)setHasHeOmitxDlmursdrec:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasHeOmitxDlmursdrec
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setHeOmitxDlmursdrecAck:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_heOmitxDlmursdrecAck = a3;
}

- (void)setHasHeOmitxDlmursdrecAck:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasHeOmitxDlmursdrecAck
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDOMICntrs;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDOMICntrs description](&v3, sel_description), -[AWDOMICntrs dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_heOmitxSched] forKey:@"he_omitx_sched"];
    __int16 has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_heOmitxSuccess] forKey:@"he_omitx_success"];
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_heOmitxRetries] forKey:@"he_omitx_retries"];
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x100) == 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_heOmitxDur] forKey:@"he_omitx_dur"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_6:
    if ((has & 0x200) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_heOmitxUlmucfg] forKey:@"he_omitx_ulmucfg"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_heOmitxUlmucfgAck] forKey:@"he_omitx_ulmucfg_ack"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_20;
  }
LABEL_19:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_heOmitxTxnsts] forKey:@"he_omitx_txnsts"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 1) == 0) {
      goto LABEL_10;
    }
LABEL_21:
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_heOmitxDlmursdrec] forKey:@"he_omitx_dlmursdrec"];
    if ((*(_WORD *)&self->_has & 2) == 0) {
      return v3;
    }
    goto LABEL_11;
  }
LABEL_20:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_heOmitxTxnstsAck] forKey:@"he_omitx_txnsts_ack"];
  __int16 has = (__int16)self->_has;
  if (has) {
    goto LABEL_21;
  }
LABEL_10:
  if ((has & 2) != 0) {
LABEL_11:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_heOmitxDlmursdrecAck] forKey:@"he_omitx_dlmursdrec_ack"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDOMICntrsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteUint32Field();
    __int16 has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x100) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_6:
    if ((has & 0x200) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 1) == 0) {
      goto LABEL_10;
    }
LABEL_20:
    PBDataWriterWriteUint32Field();
    if ((*(_WORD *)&self->_has & 2) == 0) {
      return;
    }
    goto LABEL_21;
  }
LABEL_19:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if (has) {
    goto LABEL_20;
  }
LABEL_10:
  if ((has & 2) == 0) {
    return;
  }
LABEL_21:

  PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    *((_DWORD *)a3 + 6) = self->_heOmitxSched;
    *((_WORD *)a3 + 24) |= 0x10u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 7) = self->_heOmitxSuccess;
  *((_WORD *)a3 + 24) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)a3 + 5) = self->_heOmitxRetries;
  *((_WORD *)a3 + 24) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x100) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)a3 + 4) = self->_heOmitxDur;
  *((_WORD *)a3 + 24) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_6:
    if ((has & 0x200) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)a3 + 10) = self->_heOmitxUlmucfg;
  *((_WORD *)a3 + 24) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)a3 + 11) = self->_heOmitxUlmucfgAck;
  *((_WORD *)a3 + 24) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)a3 + 8) = self->_heOmitxTxnsts;
  *((_WORD *)a3 + 24) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)a3 + 9) = self->_heOmitxTxnstsAck;
  *((_WORD *)a3 + 24) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_10:
    if ((has & 2) == 0) {
      return;
    }
LABEL_21:
    *((_DWORD *)a3 + 3) = self->_heOmitxDlmursdrecAck;
    *((_WORD *)a3 + 24) |= 2u;
    return;
  }
LABEL_20:
  *((_DWORD *)a3 + 2) = self->_heOmitxDlmursdrec;
  *((_WORD *)a3 + 24) |= 1u;
  if ((*(_WORD *)&self->_has & 2) != 0) {
    goto LABEL_21;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(id)[(id)[(id)objc_opt_class() allocWithZone:a3] init];
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    *((_DWORD *)result + 6) = self->_heOmitxSched;
    *((_WORD *)result + 24) |= 0x10u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 7) = self->_heOmitxSuccess;
  *((_WORD *)result + 24) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)result + 5) = self->_heOmitxRetries;
  *((_WORD *)result + 24) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x100) == 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)result + 4) = self->_heOmitxDur;
  *((_WORD *)result + 24) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_6:
    if ((has & 0x200) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)result + 10) = self->_heOmitxUlmucfg;
  *((_WORD *)result + 24) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)result + 11) = self->_heOmitxUlmucfgAck;
  *((_WORD *)result + 24) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)result + 8) = self->_heOmitxTxnsts;
  *((_WORD *)result + 24) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)result + 9) = self->_heOmitxTxnstsAck;
  *((_WORD *)result + 24) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_10:
    if ((has & 2) == 0) {
      return result;
    }
    goto LABEL_11;
  }
LABEL_21:
  *((_DWORD *)result + 2) = self->_heOmitxDlmursdrec;
  *((_WORD *)result + 24) |= 1u;
  if ((*(_WORD *)&self->_has & 2) == 0) {
    return result;
  }
LABEL_11:
  *((_DWORD *)result + 3) = self->_heOmitxDlmursdrecAck;
  *((_WORD *)result + 24) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    __int16 has = (__int16)self->_has;
    __int16 v7 = *((_WORD *)a3 + 24);
    if ((has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_heOmitxSched != *((_DWORD *)a3 + 6)) {
        goto LABEL_51;
      }
    }
    else if ((v7 & 0x10) != 0)
    {
LABEL_51:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((has & 0x20) != 0)
    {
      if ((v7 & 0x20) == 0 || self->_heOmitxSuccess != *((_DWORD *)a3 + 7)) {
        goto LABEL_51;
      }
    }
    else if ((v7 & 0x20) != 0)
    {
      goto LABEL_51;
    }
    if ((has & 8) != 0)
    {
      if ((v7 & 8) == 0 || self->_heOmitxRetries != *((_DWORD *)a3 + 5)) {
        goto LABEL_51;
      }
    }
    else if ((v7 & 8) != 0)
    {
      goto LABEL_51;
    }
    if ((has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_heOmitxDur != *((_DWORD *)a3 + 4)) {
        goto LABEL_51;
      }
    }
    else if ((v7 & 4) != 0)
    {
      goto LABEL_51;
    }
    if ((*(_WORD *)&self->_has & 0x100) != 0)
    {
      if ((*((_WORD *)a3 + 24) & 0x100) == 0 || self->_heOmitxUlmucfg != *((_DWORD *)a3 + 10)) {
        goto LABEL_51;
      }
    }
    else if ((*((_WORD *)a3 + 24) & 0x100) != 0)
    {
      goto LABEL_51;
    }
    if ((*(_WORD *)&self->_has & 0x200) != 0)
    {
      if ((*((_WORD *)a3 + 24) & 0x200) == 0 || self->_heOmitxUlmucfgAck != *((_DWORD *)a3 + 11)) {
        goto LABEL_51;
      }
    }
    else if ((*((_WORD *)a3 + 24) & 0x200) != 0)
    {
      goto LABEL_51;
    }
    if ((has & 0x40) != 0)
    {
      if ((v7 & 0x40) == 0 || self->_heOmitxTxnsts != *((_DWORD *)a3 + 8)) {
        goto LABEL_51;
      }
    }
    else if ((v7 & 0x40) != 0)
    {
      goto LABEL_51;
    }
    if ((has & 0x80) != 0)
    {
      if ((v7 & 0x80) == 0 || self->_heOmitxTxnstsAck != *((_DWORD *)a3 + 9)) {
        goto LABEL_51;
      }
    }
    else if ((v7 & 0x80) != 0)
    {
      goto LABEL_51;
    }
    if (has)
    {
      if ((v7 & 1) == 0 || self->_heOmitxDlmursdrec != *((_DWORD *)a3 + 2)) {
        goto LABEL_51;
      }
    }
    else if (v7)
    {
      goto LABEL_51;
    }
    LOBYTE(v5) = (v7 & 2) == 0;
    if ((has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_heOmitxDlmursdrecAck != *((_DWORD *)a3 + 3)) {
        goto LABEL_51;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    uint64_t v3 = 2654435761 * self->_heOmitxSched;
    if ((has & 0x20) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_heOmitxSuccess;
      if ((has & 8) != 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((has & 0x20) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((has & 8) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_heOmitxRetries;
    if ((has & 4) != 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v5 = 0;
  if ((has & 4) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_heOmitxDur;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v6 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_6:
    uint64_t v7 = 2654435761 * self->_heOmitxUlmucfg;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v7 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_7:
    uint64_t v8 = 2654435761 * self->_heOmitxUlmucfgAck;
    if ((has & 0x40) != 0) {
      goto LABEL_8;
    }
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v8 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_8:
    uint64_t v9 = 2654435761 * self->_heOmitxTxnsts;
    if ((has & 0x80) != 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v9 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_9:
    uint64_t v10 = 2654435761 * self->_heOmitxTxnstsAck;
    if (has) {
      goto LABEL_10;
    }
LABEL_20:
    uint64_t v11 = 0;
    if ((has & 2) != 0) {
      goto LABEL_11;
    }
LABEL_21:
    uint64_t v12 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
  }
LABEL_19:
  uint64_t v10 = 0;
  if ((has & 1) == 0) {
    goto LABEL_20;
  }
LABEL_10:
  uint64_t v11 = 2654435761 * self->_heOmitxDlmursdrec;
  if ((has & 2) == 0) {
    goto LABEL_21;
  }
LABEL_11:
  uint64_t v12 = 2654435761 * self->_heOmitxDlmursdrecAck;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  __int16 v3 = *((_WORD *)a3 + 24);
  if ((v3 & 0x10) != 0)
  {
    self->_heOmitxSched = *((_DWORD *)a3 + 6);
    *(_WORD *)&self->_has |= 0x10u;
    __int16 v3 = *((_WORD *)a3 + 24);
    if ((v3 & 0x20) == 0)
    {
LABEL_3:
      if ((v3 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((v3 & 0x20) == 0)
  {
    goto LABEL_3;
  }
  self->_heOmitxSuccess = *((_DWORD *)a3 + 7);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v3 = *((_WORD *)a3 + 24);
  if ((v3 & 8) == 0)
  {
LABEL_4:
    if ((v3 & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  self->_heOmitxRetries = *((_DWORD *)a3 + 5);
  *(_WORD *)&self->_has |= 8u;
  __int16 v3 = *((_WORD *)a3 + 24);
  if ((v3 & 4) == 0)
  {
LABEL_5:
    if ((v3 & 0x100) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  self->_heOmitxDur = *((_DWORD *)a3 + 4);
  *(_WORD *)&self->_has |= 4u;
  __int16 v3 = *((_WORD *)a3 + 24);
  if ((v3 & 0x100) == 0)
  {
LABEL_6:
    if ((v3 & 0x200) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  self->_heOmitxUlmucfg = *((_DWORD *)a3 + 10);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v3 = *((_WORD *)a3 + 24);
  if ((v3 & 0x200) == 0)
  {
LABEL_7:
    if ((v3 & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_18;
  }
LABEL_17:
  self->_heOmitxUlmucfgAck = *((_DWORD *)a3 + 11);
  *(_WORD *)&self->_has |= 0x200u;
  __int16 v3 = *((_WORD *)a3 + 24);
  if ((v3 & 0x40) == 0)
  {
LABEL_8:
    if ((v3 & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  self->_heOmitxTxnsts = *((_DWORD *)a3 + 8);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v3 = *((_WORD *)a3 + 24);
  if ((v3 & 0x80) == 0)
  {
LABEL_9:
    if ((v3 & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_20;
  }
LABEL_19:
  self->_heOmitxTxnstsAck = *((_DWORD *)a3 + 9);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v3 = *((_WORD *)a3 + 24);
  if ((v3 & 1) == 0)
  {
LABEL_10:
    if ((v3 & 2) == 0) {
      return;
    }
LABEL_21:
    self->_heOmitxDlmursdrecAck = *((_DWORD *)a3 + 3);
    *(_WORD *)&self->_has |= 2u;
    return;
  }
LABEL_20:
  self->_heOmitxDlmursdrec = *((_DWORD *)a3 + 2);
  *(_WORD *)&self->_has |= 1u;
  if ((*((_WORD *)a3 + 24) & 2) != 0) {
    goto LABEL_21;
  }
}

- (unsigned)heOmitxSched
{
  return self->_heOmitxSched;
}

- (unsigned)heOmitxSuccess
{
  return self->_heOmitxSuccess;
}

- (unsigned)heOmitxRetries
{
  return self->_heOmitxRetries;
}

- (unsigned)heOmitxDur
{
  return self->_heOmitxDur;
}

- (unsigned)heOmitxUlmucfg
{
  return self->_heOmitxUlmucfg;
}

- (unsigned)heOmitxUlmucfgAck
{
  return self->_heOmitxUlmucfgAck;
}

- (unsigned)heOmitxTxnsts
{
  return self->_heOmitxTxnsts;
}

- (unsigned)heOmitxTxnstsAck
{
  return self->_heOmitxTxnstsAck;
}

- (unsigned)heOmitxDlmursdrec
{
  return self->_heOmitxDlmursdrec;
}

- (unsigned)heOmitxDlmursdrecAck
{
  return self->_heOmitxDlmursdrecAck;
}

@end