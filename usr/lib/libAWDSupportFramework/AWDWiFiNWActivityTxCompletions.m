@interface AWDWiFiNWActivityTxCompletions
- (BOOL)hasChipmodeerror;
- (BOOL)hasExpired;
- (BOOL)hasInternalerror;
- (BOOL)hasIoerror;
- (BOOL)hasMbfree;
- (BOOL)hasNoack;
- (BOOL)hasNobuf;
- (BOOL)hasNoremotepeer;
- (BOOL)hasNoresources;
- (BOOL)hasSuccess;
- (BOOL)hasTxfailure;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)chipmodeerror;
- (unsigned)expired;
- (unsigned)internalerror;
- (unsigned)ioerror;
- (unsigned)mbfree;
- (unsigned)noack;
- (unsigned)nobuf;
- (unsigned)noremotepeer;
- (unsigned)noresources;
- (unsigned)success;
- (unsigned)txfailure;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setChipmodeerror:(unsigned int)a3;
- (void)setExpired:(unsigned int)a3;
- (void)setHasChipmodeerror:(BOOL)a3;
- (void)setHasExpired:(BOOL)a3;
- (void)setHasInternalerror:(BOOL)a3;
- (void)setHasIoerror:(BOOL)a3;
- (void)setHasMbfree:(BOOL)a3;
- (void)setHasNoack:(BOOL)a3;
- (void)setHasNobuf:(BOOL)a3;
- (void)setHasNoremotepeer:(BOOL)a3;
- (void)setHasNoresources:(BOOL)a3;
- (void)setHasSuccess:(BOOL)a3;
- (void)setHasTxfailure:(BOOL)a3;
- (void)setInternalerror:(unsigned int)a3;
- (void)setIoerror:(unsigned int)a3;
- (void)setMbfree:(unsigned int)a3;
- (void)setNoack:(unsigned int)a3;
- (void)setNobuf:(unsigned int)a3;
- (void)setNoremotepeer:(unsigned int)a3;
- (void)setNoresources:(unsigned int)a3;
- (void)setSuccess:(unsigned int)a3;
- (void)setTxfailure:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDWiFiNWActivityTxCompletions

- (void)setSuccess:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_success = a3;
}

- (void)setHasSuccess:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasSuccess
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setExpired:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_expired = a3;
}

- (void)setHasExpired:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasExpired
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setNobuf:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_nobuf = a3;
}

- (void)setHasNobuf:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasNobuf
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setNoack:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_noack = a3;
}

- (void)setHasNoack:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasNoack
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setTxfailure:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_txfailure = a3;
}

- (void)setHasTxfailure:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasTxfailure
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setNoresources:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_noresources = a3;
}

- (void)setHasNoresources:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasNoresources
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setIoerror:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_ioerror = a3;
}

- (void)setHasIoerror:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasIoerror
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setMbfree:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_mbfree = a3;
}

- (void)setHasMbfree:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasMbfree
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setChipmodeerror:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_chipmodeerror = a3;
}

- (void)setHasChipmodeerror:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasChipmodeerror
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setNoremotepeer:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_noremotepeer = a3;
}

- (void)setHasNoremotepeer:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasNoremotepeer
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setInternalerror:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_internalerror = a3;
}

- (void)setHasInternalerror:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasInternalerror
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiNWActivityTxCompletions;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWiFiNWActivityTxCompletions description](&v3, sel_description), -[AWDWiFiNWActivityTxCompletions dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_success] forKey:@"success"];
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_expired] forKey:@"expired"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_nobuf] forKey:@"nobuf"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 0x400) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_noack] forKey:@"noack"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_txfailure] forKey:@"txfailure"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_noresources] forKey:@"noresources"];
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_ioerror] forKey:@"ioerror"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_9:
    if ((has & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_22;
  }
LABEL_21:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_mbfree] forKey:@"mbfree"];
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_10:
    if ((has & 0x80) == 0) {
      goto LABEL_11;
    }
LABEL_23:
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_noremotepeer] forKey:@"noremotepeer"];
    if ((*(_WORD *)&self->_has & 4) == 0) {
      return v3;
    }
    goto LABEL_12;
  }
LABEL_22:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_chipmodeerror] forKey:@"chipmodeerror"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) != 0) {
    goto LABEL_23;
  }
LABEL_11:
  if ((has & 4) != 0) {
LABEL_12:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_internalerror] forKey:@"internalerror"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiNWActivityTxCompletionsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    PBDataWriterWriteUint32Field();
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 0x400) == 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_9:
    if ((has & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_10:
    if ((has & 0x80) == 0) {
      goto LABEL_11;
    }
LABEL_22:
    PBDataWriterWriteUint32Field();
    if ((*(_WORD *)&self->_has & 4) == 0) {
      return;
    }
    goto LABEL_23;
  }
LABEL_21:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) != 0) {
    goto LABEL_22;
  }
LABEL_11:
  if ((has & 4) == 0) {
    return;
  }
LABEL_23:

  PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    *((_DWORD *)a3 + 11) = self->_success;
    *((_WORD *)a3 + 26) |= 0x200u;
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 3) = self->_expired;
  *((_WORD *)a3 + 26) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)a3 + 8) = self->_nobuf;
  *((_WORD *)a3 + 26) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 0x400) == 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)a3 + 7) = self->_noack;
  *((_WORD *)a3 + 26) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)a3 + 12) = self->_txfailure;
  *((_WORD *)a3 + 26) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)a3 + 10) = self->_noresources;
  *((_WORD *)a3 + 26) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)a3 + 5) = self->_ioerror;
  *((_WORD *)a3 + 26) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_9:
    if ((has & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)a3 + 6) = self->_mbfree;
  *((_WORD *)a3 + 26) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_10:
    if ((has & 0x80) == 0) {
      goto LABEL_11;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)a3 + 2) = self->_chipmodeerror;
  *((_WORD *)a3 + 26) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_11:
    if ((has & 4) == 0) {
      return;
    }
LABEL_23:
    *((_DWORD *)a3 + 4) = self->_internalerror;
    *((_WORD *)a3 + 26) |= 4u;
    return;
  }
LABEL_22:
  *((_DWORD *)a3 + 9) = self->_noremotepeer;
  *((_WORD *)a3 + 26) |= 0x80u;
  if ((*(_WORD *)&self->_has & 4) != 0) {
    goto LABEL_23;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(id)[(id)[(id)objc_opt_class() allocWithZone:a3] init];
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    *((_DWORD *)result + 11) = self->_success;
    *((_WORD *)result + 26) |= 0x200u;
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 3) = self->_expired;
  *((_WORD *)result + 26) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)result + 8) = self->_nobuf;
  *((_WORD *)result + 26) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 0x400) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)result + 7) = self->_noack;
  *((_WORD *)result + 26) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)result + 12) = self->_txfailure;
  *((_WORD *)result + 26) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)result + 10) = self->_noresources;
  *((_WORD *)result + 26) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)result + 5) = self->_ioerror;
  *((_WORD *)result + 26) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_9:
    if ((has & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)result + 6) = self->_mbfree;
  *((_WORD *)result + 26) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_10:
    if ((has & 0x80) == 0) {
      goto LABEL_11;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)result + 2) = self->_chipmodeerror;
  *((_WORD *)result + 26) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_11:
    if ((has & 4) == 0) {
      return result;
    }
    goto LABEL_12;
  }
LABEL_23:
  *((_DWORD *)result + 9) = self->_noremotepeer;
  *((_WORD *)result + 26) |= 0x80u;
  if ((*(_WORD *)&self->_has & 4) == 0) {
    return result;
  }
LABEL_12:
  *((_DWORD *)result + 4) = self->_internalerror;
  *((_WORD *)result + 26) |= 4u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    __int16 has = (__int16)self->_has;
    __int16 v7 = *((_WORD *)a3 + 26);
    if ((has & 0x200) != 0)
    {
      if ((*((_WORD *)a3 + 26) & 0x200) == 0 || self->_success != *((_DWORD *)a3 + 11)) {
        goto LABEL_56;
      }
    }
    else if ((*((_WORD *)a3 + 26) & 0x200) != 0)
    {
LABEL_56:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_expired != *((_DWORD *)a3 + 3)) {
        goto LABEL_56;
      }
    }
    else if ((v7 & 2) != 0)
    {
      goto LABEL_56;
    }
    if ((has & 0x40) != 0)
    {
      if ((v7 & 0x40) == 0 || self->_nobuf != *((_DWORD *)a3 + 8)) {
        goto LABEL_56;
      }
    }
    else if ((v7 & 0x40) != 0)
    {
      goto LABEL_56;
    }
    if ((has & 0x20) != 0)
    {
      if ((v7 & 0x20) == 0 || self->_noack != *((_DWORD *)a3 + 7)) {
        goto LABEL_56;
      }
    }
    else if ((v7 & 0x20) != 0)
    {
      goto LABEL_56;
    }
    if ((*(_WORD *)&self->_has & 0x400) != 0)
    {
      if ((*((_WORD *)a3 + 26) & 0x400) == 0 || self->_txfailure != *((_DWORD *)a3 + 12)) {
        goto LABEL_56;
      }
    }
    else if ((*((_WORD *)a3 + 26) & 0x400) != 0)
    {
      goto LABEL_56;
    }
    if ((*(_WORD *)&self->_has & 0x100) != 0)
    {
      if ((*((_WORD *)a3 + 26) & 0x100) == 0 || self->_noresources != *((_DWORD *)a3 + 10)) {
        goto LABEL_56;
      }
    }
    else if ((*((_WORD *)a3 + 26) & 0x100) != 0)
    {
      goto LABEL_56;
    }
    if ((has & 8) != 0)
    {
      if ((v7 & 8) == 0 || self->_ioerror != *((_DWORD *)a3 + 5)) {
        goto LABEL_56;
      }
    }
    else if ((v7 & 8) != 0)
    {
      goto LABEL_56;
    }
    if ((has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_mbfree != *((_DWORD *)a3 + 6)) {
        goto LABEL_56;
      }
    }
    else if ((v7 & 0x10) != 0)
    {
      goto LABEL_56;
    }
    if (has)
    {
      if ((v7 & 1) == 0 || self->_chipmodeerror != *((_DWORD *)a3 + 2)) {
        goto LABEL_56;
      }
    }
    else if (v7)
    {
      goto LABEL_56;
    }
    if ((has & 0x80) != 0)
    {
      if ((v7 & 0x80) == 0 || self->_noremotepeer != *((_DWORD *)a3 + 9)) {
        goto LABEL_56;
      }
    }
    else if ((v7 & 0x80) != 0)
    {
      goto LABEL_56;
    }
    LOBYTE(v5) = (v7 & 4) == 0;
    if ((has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_internalerror != *((_DWORD *)a3 + 4)) {
        goto LABEL_56;
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
    uint64_t v3 = 2654435761 * self->_success;
    if ((has & 2) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_expired;
      if ((has & 0x40) != 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_nobuf;
    if ((has & 0x20) != 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v5 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_noack;
    if ((*(_WORD *)&self->_has & 0x400) != 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v6 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_6:
    uint64_t v7 = 2654435761 * self->_txfailure;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v7 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_7:
    uint64_t v8 = 2654435761 * self->_noresources;
    if ((has & 8) != 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v8 = 0;
  if ((has & 8) != 0)
  {
LABEL_8:
    uint64_t v9 = 2654435761 * self->_ioerror;
    if ((has & 0x10) != 0) {
      goto LABEL_9;
    }
    goto LABEL_20;
  }
LABEL_19:
  uint64_t v9 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_9:
    uint64_t v10 = 2654435761 * self->_mbfree;
    if (has) {
      goto LABEL_10;
    }
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v10 = 0;
  if (has)
  {
LABEL_10:
    uint64_t v11 = 2654435761 * self->_chipmodeerror;
    if ((has & 0x80) != 0) {
      goto LABEL_11;
    }
LABEL_22:
    uint64_t v12 = 0;
    if ((has & 4) != 0) {
      goto LABEL_12;
    }
LABEL_23:
    uint64_t v13 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
  }
LABEL_21:
  uint64_t v11 = 0;
  if ((has & 0x80) == 0) {
    goto LABEL_22;
  }
LABEL_11:
  uint64_t v12 = 2654435761 * self->_noremotepeer;
  if ((has & 4) == 0) {
    goto LABEL_23;
  }
LABEL_12:
  uint64_t v13 = 2654435761 * self->_internalerror;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
}

- (void)mergeFrom:(id)a3
{
  __int16 v3 = *((_WORD *)a3 + 26);
  if ((v3 & 0x200) != 0)
  {
    self->_success = *((_DWORD *)a3 + 11);
    *(_WORD *)&self->_has |= 0x200u;
    __int16 v3 = *((_WORD *)a3 + 26);
    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((v3 & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_expired = *((_DWORD *)a3 + 3);
  *(_WORD *)&self->_has |= 2u;
  __int16 v3 = *((_WORD *)a3 + 26);
  if ((v3 & 0x40) == 0)
  {
LABEL_4:
    if ((v3 & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  self->_nobuf = *((_DWORD *)a3 + 8);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v3 = *((_WORD *)a3 + 26);
  if ((v3 & 0x20) == 0)
  {
LABEL_5:
    if ((v3 & 0x400) == 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  self->_noack = *((_DWORD *)a3 + 7);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v3 = *((_WORD *)a3 + 26);
  if ((v3 & 0x400) == 0)
  {
LABEL_6:
    if ((v3 & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  self->_txfailure = *((_DWORD *)a3 + 12);
  *(_WORD *)&self->_has |= 0x400u;
  __int16 v3 = *((_WORD *)a3 + 26);
  if ((v3 & 0x100) == 0)
  {
LABEL_7:
    if ((v3 & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  self->_noresources = *((_DWORD *)a3 + 10);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v3 = *((_WORD *)a3 + 26);
  if ((v3 & 8) == 0)
  {
LABEL_8:
    if ((v3 & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_20;
  }
LABEL_19:
  self->_ioerror = *((_DWORD *)a3 + 5);
  *(_WORD *)&self->_has |= 8u;
  __int16 v3 = *((_WORD *)a3 + 26);
  if ((v3 & 0x10) == 0)
  {
LABEL_9:
    if ((v3 & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_21;
  }
LABEL_20:
  self->_mbfree = *((_DWORD *)a3 + 6);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v3 = *((_WORD *)a3 + 26);
  if ((v3 & 1) == 0)
  {
LABEL_10:
    if ((v3 & 0x80) == 0) {
      goto LABEL_11;
    }
    goto LABEL_22;
  }
LABEL_21:
  self->_chipmodeerror = *((_DWORD *)a3 + 2);
  *(_WORD *)&self->_has |= 1u;
  __int16 v3 = *((_WORD *)a3 + 26);
  if ((v3 & 0x80) == 0)
  {
LABEL_11:
    if ((v3 & 4) == 0) {
      return;
    }
LABEL_23:
    self->_internalerror = *((_DWORD *)a3 + 4);
    *(_WORD *)&self->_has |= 4u;
    return;
  }
LABEL_22:
  self->_noremotepeer = *((_DWORD *)a3 + 9);
  *(_WORD *)&self->_has |= 0x80u;
  if ((*((_WORD *)a3 + 26) & 4) != 0) {
    goto LABEL_23;
  }
}

- (unsigned)success
{
  return self->_success;
}

- (unsigned)expired
{
  return self->_expired;
}

- (unsigned)nobuf
{
  return self->_nobuf;
}

- (unsigned)noack
{
  return self->_noack;
}

- (unsigned)txfailure
{
  return self->_txfailure;
}

- (unsigned)noresources
{
  return self->_noresources;
}

- (unsigned)ioerror
{
  return self->_ioerror;
}

- (unsigned)mbfree
{
  return self->_mbfree;
}

- (unsigned)chipmodeerror
{
  return self->_chipmodeerror;
}

- (unsigned)noremotepeer
{
  return self->_noremotepeer;
}

- (unsigned)internalerror
{
  return self->_internalerror;
}

@end