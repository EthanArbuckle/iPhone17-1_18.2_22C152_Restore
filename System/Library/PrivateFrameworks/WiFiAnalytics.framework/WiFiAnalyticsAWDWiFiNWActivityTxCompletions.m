@interface WiFiAnalyticsAWDWiFiNWActivityTxCompletions
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

@implementation WiFiAnalyticsAWDWiFiNWActivityTxCompletions

- (void)writeTo:(id)a3
{
  id v5 = a3;
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
      goto LABEL_18;
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
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 0x400) == 0) {
      goto LABEL_6;
    }
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_9:
    if ((has & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_10:
    if ((has & 0x80) == 0) {
      goto LABEL_11;
    }
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_11:
    if ((has & 4) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_25:
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 4) != 0) {
LABEL_12:
  }
    PBDataWriterWriteUint32Field();
LABEL_13:
}

- (void)setTxfailure:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_txfailure = a3;
}

- (void)setSuccess:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_success = a3;
}

- (void)setNoresources:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_noresources = a3;
}

- (void)setNoremotepeer:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_noremotepeer = a3;
}

- (void)setNobuf:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_nobuf = a3;
}

- (void)setNoack:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_noack = a3;
}

- (void)setMbfree:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_mbfree = a3;
}

- (void)setIoerror:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_ioerror = a3;
}

- (void)setInternalerror:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_internalerror = a3;
}

- (void)setExpired:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_expired = a3;
}

- (void)setChipmodeerror:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_chipmodeerror = a3;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    v7 = [NSNumber numberWithUnsignedInt:self->_success];
    [v3 setObject:v7 forKey:@"success"];

    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  v8 = [NSNumber numberWithUnsignedInt:self->_expired];
  [v3 setObject:v8 forKey:@"expired"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
LABEL_18:
  v9 = [NSNumber numberWithUnsignedInt:self->_nobuf];
  [v3 setObject:v9 forKey:@"nobuf"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 0x400) == 0) {
      goto LABEL_6;
    }
    goto LABEL_20;
  }
LABEL_19:
  v10 = [NSNumber numberWithUnsignedInt:self->_noack];
  [v3 setObject:v10 forKey:@"noack"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_21;
  }
LABEL_20:
  v11 = [NSNumber numberWithUnsignedInt:self->_txfailure];
  [v3 setObject:v11 forKey:@"txfailure"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_22;
  }
LABEL_21:
  v12 = [NSNumber numberWithUnsignedInt:self->_noresources];
  [v3 setObject:v12 forKey:@"noresources"];

  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_23;
  }
LABEL_22:
  v13 = [NSNumber numberWithUnsignedInt:self->_ioerror];
  [v3 setObject:v13 forKey:@"ioerror"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_9:
    if ((has & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_24;
  }
LABEL_23:
  v14 = [NSNumber numberWithUnsignedInt:self->_mbfree];
  [v3 setObject:v14 forKey:@"mbfree"];

  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_10:
    if ((has & 0x80) == 0) {
      goto LABEL_11;
    }
    goto LABEL_25;
  }
LABEL_24:
  v15 = [NSNumber numberWithUnsignedInt:self->_chipmodeerror];
  [v3 setObject:v15 forKey:@"chipmodeerror"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_11:
    if ((has & 4) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_25:
  v16 = [NSNumber numberWithUnsignedInt:self->_noremotepeer];
  [v3 setObject:v16 forKey:@"noremotepeer"];

  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_12:
    id v5 = [NSNumber numberWithUnsignedInt:self->_internalerror];
    [v3 setObject:v5 forKey:@"internalerror"];
  }
LABEL_13:
  return v3;
}

- (void)setHasSuccess:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasSuccess
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setHasExpired:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasExpired
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setHasNobuf:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasNobuf
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setHasNoack:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasNoack
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setHasTxfailure:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasTxfailure
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setHasNoresources:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasNoresources
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setHasIoerror:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasIoerror
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setHasMbfree:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasMbfree
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setHasChipmodeerror:(BOOL)a3
{
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasChipmodeerror
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setHasNoremotepeer:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasNoremotepeer
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setHasInternalerror:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasInternalerror
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (id)description
{
  __int16 v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)WiFiAnalyticsAWDWiFiNWActivityTxCompletions;
  v4 = [(WiFiAnalyticsAWDWiFiNWActivityTxCompletions *)&v8 description];
  id v5 = [(WiFiAnalyticsAWDWiFiNWActivityTxCompletions *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return WiFiAnalyticsAWDWiFiNWActivityTxCompletionsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    v4[11] = self->_success;
    *((_WORD *)v4 + 26) |= 0x200u;
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  v4[3] = self->_expired;
  *((_WORD *)v4 + 26) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
LABEL_18:
  v4[8] = self->_nobuf;
  *((_WORD *)v4 + 26) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 0x400) == 0) {
      goto LABEL_6;
    }
    goto LABEL_20;
  }
LABEL_19:
  v4[7] = self->_noack;
  *((_WORD *)v4 + 26) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_21;
  }
LABEL_20:
  v4[12] = self->_txfailure;
  *((_WORD *)v4 + 26) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_22;
  }
LABEL_21:
  v4[10] = self->_noresources;
  *((_WORD *)v4 + 26) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_23;
  }
LABEL_22:
  v4[5] = self->_ioerror;
  *((_WORD *)v4 + 26) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_9:
    if ((has & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_24;
  }
LABEL_23:
  v4[6] = self->_mbfree;
  *((_WORD *)v4 + 26) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_10:
    if ((has & 0x80) == 0) {
      goto LABEL_11;
    }
    goto LABEL_25;
  }
LABEL_24:
  v4[2] = self->_chipmodeerror;
  *((_WORD *)v4 + 26) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_11:
    if ((has & 4) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_25:
  v4[9] = self->_noremotepeer;
  *((_WORD *)v4 + 26) |= 0x80u;
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_12:
    v4[4] = self->_internalerror;
    *((_WORD *)v4 + 26) |= 4u;
  }
LABEL_13:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
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
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_57;
  }
  __int16 has = (__int16)self->_has;
  __int16 v6 = *((_WORD *)v4 + 26);
  if ((has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 26) & 0x200) == 0 || self->_success != *((_DWORD *)v4 + 11)) {
      goto LABEL_57;
    }
  }
  else if ((*((_WORD *)v4 + 26) & 0x200) != 0)
  {
LABEL_57:
    BOOL v7 = 0;
    goto LABEL_58;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_expired != *((_DWORD *)v4 + 3)) {
      goto LABEL_57;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_57;
  }
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_nobuf != *((_DWORD *)v4 + 8)) {
      goto LABEL_57;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_57;
  }
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_noack != *((_DWORD *)v4 + 7)) {
      goto LABEL_57;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_57;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 26) & 0x400) == 0 || self->_txfailure != *((_DWORD *)v4 + 12)) {
      goto LABEL_57;
    }
  }
  else if ((*((_WORD *)v4 + 26) & 0x400) != 0)
  {
    goto LABEL_57;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 26) & 0x100) == 0 || self->_noresources != *((_DWORD *)v4 + 10)) {
      goto LABEL_57;
    }
  }
  else if ((*((_WORD *)v4 + 26) & 0x100) != 0)
  {
    goto LABEL_57;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_ioerror != *((_DWORD *)v4 + 5)) {
      goto LABEL_57;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_57;
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_mbfree != *((_DWORD *)v4 + 6)) {
      goto LABEL_57;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_57;
  }
  if (has)
  {
    if ((v6 & 1) == 0 || self->_chipmodeerror != *((_DWORD *)v4 + 2)) {
      goto LABEL_57;
    }
  }
  else if (v6)
  {
    goto LABEL_57;
  }
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_noremotepeer != *((_DWORD *)v4 + 9)) {
      goto LABEL_57;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_57;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_internalerror != *((_DWORD *)v4 + 4)) {
      goto LABEL_57;
    }
    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = (v6 & 4) == 0;
  }
LABEL_58:

  return v7;
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
  id v4 = a3;
  __int16 v5 = *((_WORD *)v4 + 26);
  if ((v5 & 0x200) != 0)
  {
    self->_success = *((_DWORD *)v4 + 11);
    *(_WORD *)&self->_has |= 0x200u;
    __int16 v5 = *((_WORD *)v4 + 26);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else if ((v5 & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_expired = *((_DWORD *)v4 + 3);
  *(_WORD *)&self->_has |= 2u;
  __int16 v5 = *((_WORD *)v4 + 26);
  if ((v5 & 0x40) == 0)
  {
LABEL_4:
    if ((v5 & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
LABEL_18:
  self->_nobuf = *((_DWORD *)v4 + 8);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v5 = *((_WORD *)v4 + 26);
  if ((v5 & 0x20) == 0)
  {
LABEL_5:
    if ((v5 & 0x400) == 0) {
      goto LABEL_6;
    }
    goto LABEL_20;
  }
LABEL_19:
  self->_noack = *((_DWORD *)v4 + 7);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v5 = *((_WORD *)v4 + 26);
  if ((v5 & 0x400) == 0)
  {
LABEL_6:
    if ((v5 & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_21;
  }
LABEL_20:
  self->_txfailure = *((_DWORD *)v4 + 12);
  *(_WORD *)&self->_has |= 0x400u;
  __int16 v5 = *((_WORD *)v4 + 26);
  if ((v5 & 0x100) == 0)
  {
LABEL_7:
    if ((v5 & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_22;
  }
LABEL_21:
  self->_noresources = *((_DWORD *)v4 + 10);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v5 = *((_WORD *)v4 + 26);
  if ((v5 & 8) == 0)
  {
LABEL_8:
    if ((v5 & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_23;
  }
LABEL_22:
  self->_ioerror = *((_DWORD *)v4 + 5);
  *(_WORD *)&self->_has |= 8u;
  __int16 v5 = *((_WORD *)v4 + 26);
  if ((v5 & 0x10) == 0)
  {
LABEL_9:
    if ((v5 & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_24;
  }
LABEL_23:
  self->_mbfree = *((_DWORD *)v4 + 6);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v5 = *((_WORD *)v4 + 26);
  if ((v5 & 1) == 0)
  {
LABEL_10:
    if ((v5 & 0x80) == 0) {
      goto LABEL_11;
    }
    goto LABEL_25;
  }
LABEL_24:
  self->_chipmodeerror = *((_DWORD *)v4 + 2);
  *(_WORD *)&self->_has |= 1u;
  __int16 v5 = *((_WORD *)v4 + 26);
  if ((v5 & 0x80) == 0)
  {
LABEL_11:
    if ((v5 & 4) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_25:
  self->_noremotepeer = *((_DWORD *)v4 + 9);
  *(_WORD *)&self->_has |= 0x80u;
  if ((*((_WORD *)v4 + 26) & 4) != 0)
  {
LABEL_12:
    self->_internalerror = *((_DWORD *)v4 + 4);
    *(_WORD *)&self->_has |= 4u;
  }
LABEL_13:
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