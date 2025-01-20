@interface AWDLibnetcoreTCPKernelStats
- (BOOL)hasNumTfoBlackholed;
- (BOOL)hasNumTfoCookieInvalid;
- (BOOL)hasNumTfoCookieRcv;
- (BOOL)hasNumTfoCookieReq;
- (BOOL)hasNumTfoCookieReqRcv;
- (BOOL)hasNumTfoCookieSent;
- (BOOL)hasNumTfoFallback;
- (BOOL)hasNumTfoSynDataAcked;
- (BOOL)hasNumTfoSynDataRcv;
- (BOOL)hasNumTfoSynDataSent;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)numTfoBlackholed;
- (unint64_t)numTfoCookieInvalid;
- (unint64_t)numTfoCookieRcv;
- (unint64_t)numTfoCookieReq;
- (unint64_t)numTfoCookieReqRcv;
- (unint64_t)numTfoCookieSent;
- (unint64_t)numTfoFallback;
- (unint64_t)numTfoSynDataAcked;
- (unint64_t)numTfoSynDataRcv;
- (unint64_t)numTfoSynDataSent;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasNumTfoBlackholed:(BOOL)a3;
- (void)setHasNumTfoCookieInvalid:(BOOL)a3;
- (void)setHasNumTfoCookieRcv:(BOOL)a3;
- (void)setHasNumTfoCookieReq:(BOOL)a3;
- (void)setHasNumTfoCookieReqRcv:(BOOL)a3;
- (void)setHasNumTfoCookieSent:(BOOL)a3;
- (void)setHasNumTfoFallback:(BOOL)a3;
- (void)setHasNumTfoSynDataAcked:(BOOL)a3;
- (void)setHasNumTfoSynDataRcv:(BOOL)a3;
- (void)setHasNumTfoSynDataSent:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setNumTfoBlackholed:(unint64_t)a3;
- (void)setNumTfoCookieInvalid:(unint64_t)a3;
- (void)setNumTfoCookieRcv:(unint64_t)a3;
- (void)setNumTfoCookieReq:(unint64_t)a3;
- (void)setNumTfoCookieReqRcv:(unint64_t)a3;
- (void)setNumTfoCookieSent:(unint64_t)a3;
- (void)setNumTfoFallback:(unint64_t)a3;
- (void)setNumTfoSynDataAcked:(unint64_t)a3;
- (void)setNumTfoSynDataRcv:(unint64_t)a3;
- (void)setNumTfoSynDataSent:(unint64_t)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDLibnetcoreTCPKernelStats

- (void)setTimestamp:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setNumTfoCookieReq:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_numTfoCookieReq = a3;
}

- (void)setHasNumTfoCookieReq:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasNumTfoCookieReq
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setNumTfoCookieRcv:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_numTfoCookieRcv = a3;
}

- (void)setHasNumTfoCookieRcv:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasNumTfoCookieRcv
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setNumTfoFallback:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_numTfoFallback = a3;
}

- (void)setHasNumTfoFallback:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasNumTfoFallback
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setNumTfoSynDataSent:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_numTfoSynDataSent = a3;
}

- (void)setHasNumTfoSynDataSent:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasNumTfoSynDataSent
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setNumTfoSynDataAcked:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_numTfoSynDataAcked = a3;
}

- (void)setHasNumTfoSynDataAcked:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasNumTfoSynDataAcked
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setNumTfoSynDataRcv:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_numTfoSynDataRcv = a3;
}

- (void)setHasNumTfoSynDataRcv:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasNumTfoSynDataRcv
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setNumTfoCookieReqRcv:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_numTfoCookieReqRcv = a3;
}

- (void)setHasNumTfoCookieReqRcv:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasNumTfoCookieReqRcv
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setNumTfoCookieSent:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_numTfoCookieSent = a3;
}

- (void)setHasNumTfoCookieSent:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasNumTfoCookieSent
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setNumTfoCookieInvalid:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_numTfoCookieInvalid = a3;
}

- (void)setHasNumTfoCookieInvalid:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasNumTfoCookieInvalid
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setNumTfoBlackholed:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_numTfoBlackholed = a3;
}

- (void)setHasNumTfoBlackholed:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasNumTfoBlackholed
{
  return *(_WORD *)&self->_has & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDLibnetcoreTCPKernelStats;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDLibnetcoreTCPKernelStats description](&v3, sel_description), -[AWDLibnetcoreTCPKernelStats dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_numTfoCookieReq] forKey:@"numTfoCookieReq"];
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_numTfoCookieRcv] forKey:@"numTfoCookieRcv"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x200) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_numTfoFallback] forKey:@"numTfoFallback"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_6:
    if ((has & 0x80) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_numTfoSynDataSent] forKey:@"numTfoSynDataSent"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_7:
    if ((has & 0x100) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_numTfoSynDataAcked] forKey:@"numTfoSynDataAcked"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_numTfoSynDataRcv] forKey:@"numTfoSynDataRcv"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_22;
  }
LABEL_21:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_numTfoCookieReqRcv] forKey:@"numTfoCookieReqRcv"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 2) == 0) {
      goto LABEL_11;
    }
LABEL_23:
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_numTfoCookieInvalid] forKey:@"numTfoCookieInvalid"];
    if ((*(_WORD *)&self->_has & 1) == 0) {
      return v3;
    }
    goto LABEL_12;
  }
LABEL_22:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_numTfoCookieSent] forKey:@"numTfoCookieSent"];
  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_23;
  }
LABEL_11:
  if (has) {
LABEL_12:
  }
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_numTfoBlackholed] forKey:@"numTfoBlackholed"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDLibnetcoreTCPKernelStatsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) != 0)
  {
    PBDataWriterWriteUint64Field();
    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
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
    if ((has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x200) == 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_6:
    if ((has & 0x80) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_7:
    if ((has & 0x100) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 2) == 0) {
      goto LABEL_11;
    }
LABEL_22:
    PBDataWriterWriteUint64Field();
    if ((*(_WORD *)&self->_has & 1) == 0) {
      return;
    }
    goto LABEL_23;
  }
LABEL_21:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_22;
  }
LABEL_11:
  if ((has & 1) == 0) {
    return;
  }
LABEL_23:

  PBDataWriterWriteUint64Field();
}

- (void)copyTo:(id)a3
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) != 0)
  {
    *((void *)a3 + 11) = self->_timestamp;
    *((_WORD *)a3 + 48) |= 0x400u;
    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((void *)a3 + 4) = self->_numTfoCookieReq;
  *((_WORD *)a3 + 48) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  *((void *)a3 + 3) = self->_numTfoCookieRcv;
  *((_WORD *)a3 + 48) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x200) == 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((void *)a3 + 7) = self->_numTfoFallback;
  *((_WORD *)a3 + 48) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_6:
    if ((has & 0x80) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  *((void *)a3 + 10) = self->_numTfoSynDataSent;
  *((_WORD *)a3 + 48) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_7:
    if ((has & 0x100) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((void *)a3 + 8) = self->_numTfoSynDataAcked;
  *((_WORD *)a3 + 48) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((void *)a3 + 9) = self->_numTfoSynDataRcv;
  *((_WORD *)a3 + 48) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((void *)a3 + 5) = self->_numTfoCookieReqRcv;
  *((_WORD *)a3 + 48) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 2) == 0) {
      goto LABEL_11;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((void *)a3 + 6) = self->_numTfoCookieSent;
  *((_WORD *)a3 + 48) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_11:
    if ((has & 1) == 0) {
      return;
    }
LABEL_23:
    *((void *)a3 + 1) = self->_numTfoBlackholed;
    *((_WORD *)a3 + 48) |= 1u;
    return;
  }
LABEL_22:
  *((void *)a3 + 2) = self->_numTfoCookieInvalid;
  *((_WORD *)a3 + 48) |= 2u;
  if (*(_WORD *)&self->_has) {
    goto LABEL_23;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(id)[(id)[(id)objc_opt_class() allocWithZone:a3] init];
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) != 0)
  {
    *((void *)result + 11) = self->_timestamp;
    *((_WORD *)result + 48) |= 0x400u;
    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((void *)result + 4) = self->_numTfoCookieReq;
  *((_WORD *)result + 48) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((void *)result + 3) = self->_numTfoCookieRcv;
  *((_WORD *)result + 48) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x200) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  *((void *)result + 7) = self->_numTfoFallback;
  *((_WORD *)result + 48) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_6:
    if ((has & 0x80) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((void *)result + 10) = self->_numTfoSynDataSent;
  *((_WORD *)result + 48) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_7:
    if ((has & 0x100) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((void *)result + 8) = self->_numTfoSynDataAcked;
  *((_WORD *)result + 48) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((void *)result + 9) = self->_numTfoSynDataRcv;
  *((_WORD *)result + 48) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((void *)result + 5) = self->_numTfoCookieReqRcv;
  *((_WORD *)result + 48) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 2) == 0) {
      goto LABEL_11;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((void *)result + 6) = self->_numTfoCookieSent;
  *((_WORD *)result + 48) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_11:
    if ((has & 1) == 0) {
      return result;
    }
    goto LABEL_12;
  }
LABEL_23:
  *((void *)result + 2) = self->_numTfoCookieInvalid;
  *((_WORD *)result + 48) |= 2u;
  if ((*(_WORD *)&self->_has & 1) == 0) {
    return result;
  }
LABEL_12:
  *((void *)result + 1) = self->_numTfoBlackholed;
  *((_WORD *)result + 48) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    __int16 has = (__int16)self->_has;
    __int16 v7 = *((_WORD *)a3 + 48);
    if ((has & 0x400) != 0)
    {
      if ((*((_WORD *)a3 + 48) & 0x400) == 0 || self->_timestamp != *((void *)a3 + 11)) {
        goto LABEL_56;
      }
    }
    else if ((*((_WORD *)a3 + 48) & 0x400) != 0)
    {
LABEL_56:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((has & 8) != 0)
    {
      if ((v7 & 8) == 0 || self->_numTfoCookieReq != *((void *)a3 + 4)) {
        goto LABEL_56;
      }
    }
    else if ((v7 & 8) != 0)
    {
      goto LABEL_56;
    }
    if ((has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_numTfoCookieRcv != *((void *)a3 + 3)) {
        goto LABEL_56;
      }
    }
    else if ((v7 & 4) != 0)
    {
      goto LABEL_56;
    }
    if ((has & 0x40) != 0)
    {
      if ((v7 & 0x40) == 0 || self->_numTfoFallback != *((void *)a3 + 7)) {
        goto LABEL_56;
      }
    }
    else if ((v7 & 0x40) != 0)
    {
      goto LABEL_56;
    }
    if ((*(_WORD *)&self->_has & 0x200) != 0)
    {
      if ((*((_WORD *)a3 + 48) & 0x200) == 0 || self->_numTfoSynDataSent != *((void *)a3 + 10)) {
        goto LABEL_56;
      }
    }
    else if ((*((_WORD *)a3 + 48) & 0x200) != 0)
    {
      goto LABEL_56;
    }
    if ((has & 0x80) != 0)
    {
      if ((v7 & 0x80) == 0 || self->_numTfoSynDataAcked != *((void *)a3 + 8)) {
        goto LABEL_56;
      }
    }
    else if ((v7 & 0x80) != 0)
    {
      goto LABEL_56;
    }
    if ((*(_WORD *)&self->_has & 0x100) != 0)
    {
      if ((*((_WORD *)a3 + 48) & 0x100) == 0 || self->_numTfoSynDataRcv != *((void *)a3 + 9)) {
        goto LABEL_56;
      }
    }
    else if ((*((_WORD *)a3 + 48) & 0x100) != 0)
    {
      goto LABEL_56;
    }
    if ((has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_numTfoCookieReqRcv != *((void *)a3 + 5)) {
        goto LABEL_56;
      }
    }
    else if ((v7 & 0x10) != 0)
    {
      goto LABEL_56;
    }
    if ((has & 0x20) != 0)
    {
      if ((v7 & 0x20) == 0 || self->_numTfoCookieSent != *((void *)a3 + 6)) {
        goto LABEL_56;
      }
    }
    else if ((v7 & 0x20) != 0)
    {
      goto LABEL_56;
    }
    if ((has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_numTfoCookieInvalid != *((void *)a3 + 2)) {
        goto LABEL_56;
      }
    }
    else if ((v7 & 2) != 0)
    {
      goto LABEL_56;
    }
    LOBYTE(v5) = (v7 & 1) == 0;
    if (has)
    {
      if ((v7 & 1) == 0 || self->_numTfoBlackholed != *((void *)a3 + 1)) {
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
  if ((has & 0x400) != 0)
  {
    unint64_t v3 = 2654435761u * self->_timestamp;
    if ((has & 8) != 0)
    {
LABEL_3:
      unint64_t v4 = 2654435761u * self->_numTfoCookieReq;
      if ((has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else
  {
    unint64_t v3 = 0;
    if ((has & 8) != 0) {
      goto LABEL_3;
    }
  }
  unint64_t v4 = 0;
  if ((has & 4) != 0)
  {
LABEL_4:
    unint64_t v5 = 2654435761u * self->_numTfoCookieRcv;
    if ((has & 0x40) != 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  unint64_t v5 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_5:
    unint64_t v6 = 2654435761u * self->_numTfoFallback;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  unint64_t v6 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_6:
    unint64_t v7 = 2654435761u * self->_numTfoSynDataSent;
    if ((has & 0x80) != 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  unint64_t v7 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_7:
    unint64_t v8 = 2654435761u * self->_numTfoSynDataAcked;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  unint64_t v8 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_8:
    unint64_t v9 = 2654435761u * self->_numTfoSynDataRcv;
    if ((has & 0x10) != 0) {
      goto LABEL_9;
    }
    goto LABEL_20;
  }
LABEL_19:
  unint64_t v9 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_9:
    unint64_t v10 = 2654435761u * self->_numTfoCookieReqRcv;
    if ((has & 0x20) != 0) {
      goto LABEL_10;
    }
    goto LABEL_21;
  }
LABEL_20:
  unint64_t v10 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_10:
    unint64_t v11 = 2654435761u * self->_numTfoCookieSent;
    if ((has & 2) != 0) {
      goto LABEL_11;
    }
LABEL_22:
    unint64_t v12 = 0;
    if (has) {
      goto LABEL_12;
    }
LABEL_23:
    unint64_t v13 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
  }
LABEL_21:
  unint64_t v11 = 0;
  if ((has & 2) == 0) {
    goto LABEL_22;
  }
LABEL_11:
  unint64_t v12 = 2654435761u * self->_numTfoCookieInvalid;
  if ((has & 1) == 0) {
    goto LABEL_23;
  }
LABEL_12:
  unint64_t v13 = 2654435761u * self->_numTfoBlackholed;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
}

- (void)mergeFrom:(id)a3
{
  __int16 v3 = *((_WORD *)a3 + 48);
  if ((v3 & 0x400) != 0)
  {
    self->_timestamp = *((void *)a3 + 11);
    *(_WORD *)&self->_has |= 0x400u;
    __int16 v3 = *((_WORD *)a3 + 48);
    if ((v3 & 8) == 0)
    {
LABEL_3:
      if ((v3 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((v3 & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_numTfoCookieReq = *((void *)a3 + 4);
  *(_WORD *)&self->_has |= 8u;
  __int16 v3 = *((_WORD *)a3 + 48);
  if ((v3 & 4) == 0)
  {
LABEL_4:
    if ((v3 & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  self->_numTfoCookieRcv = *((void *)a3 + 3);
  *(_WORD *)&self->_has |= 4u;
  __int16 v3 = *((_WORD *)a3 + 48);
  if ((v3 & 0x40) == 0)
  {
LABEL_5:
    if ((v3 & 0x200) == 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  self->_numTfoFallback = *((void *)a3 + 7);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v3 = *((_WORD *)a3 + 48);
  if ((v3 & 0x200) == 0)
  {
LABEL_6:
    if ((v3 & 0x80) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  self->_numTfoSynDataSent = *((void *)a3 + 10);
  *(_WORD *)&self->_has |= 0x200u;
  __int16 v3 = *((_WORD *)a3 + 48);
  if ((v3 & 0x80) == 0)
  {
LABEL_7:
    if ((v3 & 0x100) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  self->_numTfoSynDataAcked = *((void *)a3 + 8);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v3 = *((_WORD *)a3 + 48);
  if ((v3 & 0x100) == 0)
  {
LABEL_8:
    if ((v3 & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_20;
  }
LABEL_19:
  self->_numTfoSynDataRcv = *((void *)a3 + 9);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v3 = *((_WORD *)a3 + 48);
  if ((v3 & 0x10) == 0)
  {
LABEL_9:
    if ((v3 & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_21;
  }
LABEL_20:
  self->_numTfoCookieReqRcv = *((void *)a3 + 5);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v3 = *((_WORD *)a3 + 48);
  if ((v3 & 0x20) == 0)
  {
LABEL_10:
    if ((v3 & 2) == 0) {
      goto LABEL_11;
    }
    goto LABEL_22;
  }
LABEL_21:
  self->_numTfoCookieSent = *((void *)a3 + 6);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v3 = *((_WORD *)a3 + 48);
  if ((v3 & 2) == 0)
  {
LABEL_11:
    if ((v3 & 1) == 0) {
      return;
    }
LABEL_23:
    self->_numTfoBlackholed = *((void *)a3 + 1);
    *(_WORD *)&self->_has |= 1u;
    return;
  }
LABEL_22:
  self->_numTfoCookieInvalid = *((void *)a3 + 2);
  *(_WORD *)&self->_has |= 2u;
  if (*((_WORD *)a3 + 48)) {
    goto LABEL_23;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unint64_t)numTfoCookieReq
{
  return self->_numTfoCookieReq;
}

- (unint64_t)numTfoCookieRcv
{
  return self->_numTfoCookieRcv;
}

- (unint64_t)numTfoFallback
{
  return self->_numTfoFallback;
}

- (unint64_t)numTfoSynDataSent
{
  return self->_numTfoSynDataSent;
}

- (unint64_t)numTfoSynDataAcked
{
  return self->_numTfoSynDataAcked;
}

- (unint64_t)numTfoSynDataRcv
{
  return self->_numTfoSynDataRcv;
}

- (unint64_t)numTfoCookieReqRcv
{
  return self->_numTfoCookieReqRcv;
}

- (unint64_t)numTfoCookieSent
{
  return self->_numTfoCookieSent;
}

- (unint64_t)numTfoCookieInvalid
{
  return self->_numTfoCookieInvalid;
}

- (unint64_t)numTfoBlackholed
{
  return self->_numTfoBlackholed;
}

@end