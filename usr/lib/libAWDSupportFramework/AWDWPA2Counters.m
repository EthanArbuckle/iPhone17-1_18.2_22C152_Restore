@interface AWDWPA2Counters
- (BOOL)hasCcmpfmterr;
- (BOOL)hasCcmpreplay;
- (BOOL)hasCcmpundec;
- (BOOL)hasDecsuccess;
- (BOOL)hasFourwayfail;
- (BOOL)hasTkipcntrmsr;
- (BOOL)hasTkipicverr;
- (BOOL)hasTkipmicfaill;
- (BOOL)hasTkipreplay;
- (BOOL)hasWepexcluded;
- (BOOL)hasWepicverr;
- (BOOL)hasWepundec;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)ccmpfmterr;
- (unint64_t)ccmpreplay;
- (unint64_t)ccmpundec;
- (unint64_t)decsuccess;
- (unint64_t)fourwayfail;
- (unint64_t)hash;
- (unint64_t)tkipcntrmsr;
- (unint64_t)tkipicverr;
- (unint64_t)tkipmicfaill;
- (unint64_t)tkipreplay;
- (unint64_t)wepexcluded;
- (unint64_t)wepicverr;
- (unint64_t)wepundec;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCcmpfmterr:(unint64_t)a3;
- (void)setCcmpreplay:(unint64_t)a3;
- (void)setCcmpundec:(unint64_t)a3;
- (void)setDecsuccess:(unint64_t)a3;
- (void)setFourwayfail:(unint64_t)a3;
- (void)setHasCcmpfmterr:(BOOL)a3;
- (void)setHasCcmpreplay:(BOOL)a3;
- (void)setHasCcmpundec:(BOOL)a3;
- (void)setHasDecsuccess:(BOOL)a3;
- (void)setHasFourwayfail:(BOOL)a3;
- (void)setHasTkipcntrmsr:(BOOL)a3;
- (void)setHasTkipicverr:(BOOL)a3;
- (void)setHasTkipmicfaill:(BOOL)a3;
- (void)setHasTkipreplay:(BOOL)a3;
- (void)setHasWepexcluded:(BOOL)a3;
- (void)setHasWepicverr:(BOOL)a3;
- (void)setHasWepundec:(BOOL)a3;
- (void)setTkipcntrmsr:(unint64_t)a3;
- (void)setTkipicverr:(unint64_t)a3;
- (void)setTkipmicfaill:(unint64_t)a3;
- (void)setTkipreplay:(unint64_t)a3;
- (void)setWepexcluded:(unint64_t)a3;
- (void)setWepicverr:(unint64_t)a3;
- (void)setWepundec:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDWPA2Counters

- (void)setTkipmicfaill:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_tkipmicfaill = a3;
}

- (void)setHasTkipmicfaill:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasTkipmicfaill
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setTkipcntrmsr:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_tkipcntrmsr = a3;
}

- (void)setHasTkipcntrmsr:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasTkipcntrmsr
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setTkipreplay:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_tkipreplay = a3;
}

- (void)setHasTkipreplay:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasTkipreplay
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setCcmpfmterr:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_ccmpfmterr = a3;
}

- (void)setHasCcmpfmterr:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasCcmpfmterr
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setCcmpreplay:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_ccmpreplay = a3;
}

- (void)setHasCcmpreplay:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasCcmpreplay
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setCcmpundec:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_ccmpundec = a3;
}

- (void)setHasCcmpundec:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasCcmpundec
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setFourwayfail:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_fourwayfail = a3;
}

- (void)setHasFourwayfail:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasFourwayfail
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setWepundec:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_wepundec = a3;
}

- (void)setHasWepundec:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasWepundec
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setWepicverr:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_wepicverr = a3;
}

- (void)setHasWepicverr:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasWepicverr
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setDecsuccess:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_decsuccess = a3;
}

- (void)setHasDecsuccess:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasDecsuccess
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setTkipicverr:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_tkipicverr = a3;
}

- (void)setHasTkipicverr:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasTkipicverr
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setWepexcluded:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_wepexcluded = a3;
}

- (void)setHasWepexcluded:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasWepexcluded
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDWPA2Counters;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWPA2Counters description](&v3, sel_description), -[AWDWPA2Counters dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_tkipmicfaill] forKey:@"tkipmicfaill"];
    __int16 has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_tkipcntrmsr] forKey:@"tkipcntrmsr"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
LABEL_17:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_tkipreplay] forKey:@"tkipreplay"];
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_19;
  }
LABEL_18:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_ccmpfmterr] forKey:@"ccmpfmterr"];
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_20;
  }
LABEL_19:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_ccmpreplay] forKey:@"ccmpreplay"];
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_21;
  }
LABEL_20:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_ccmpundec] forKey:@"ccmpundec"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x800) == 0) {
      goto LABEL_9;
    }
    goto LABEL_22;
  }
LABEL_21:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_fourwayfail] forKey:@"fourwayfail"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_9:
    if ((has & 0x400) == 0) {
      goto LABEL_10;
    }
    goto LABEL_23;
  }
LABEL_22:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_wepundec] forKey:@"wepundec"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_10:
    if ((has & 8) == 0) {
      goto LABEL_11;
    }
    goto LABEL_24;
  }
LABEL_23:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_wepicverr] forKey:@"wepicverr"];
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_11:
    if ((has & 0x40) == 0) {
      goto LABEL_12;
    }
LABEL_25:
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_tkipicverr] forKey:@"tkipicverr"];
    if ((*(_WORD *)&self->_has & 0x200) == 0) {
      return v3;
    }
    goto LABEL_13;
  }
LABEL_24:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_decsuccess] forKey:@"decsuccess"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0) {
    goto LABEL_25;
  }
LABEL_12:
  if ((has & 0x200) != 0) {
LABEL_13:
  }
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_wepexcluded] forKey:@"wepexcluded"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWPA2CountersReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) != 0)
  {
    PBDataWriterWriteUint64Field();
    __int16 has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x800) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_9:
    if ((has & 0x400) == 0) {
      goto LABEL_10;
    }
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_10:
    if ((has & 8) == 0) {
      goto LABEL_11;
    }
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_11:
    if ((has & 0x40) == 0) {
      goto LABEL_12;
    }
LABEL_24:
    PBDataWriterWriteUint64Field();
    if ((*(_WORD *)&self->_has & 0x200) == 0) {
      return;
    }
    goto LABEL_25;
  }
LABEL_23:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0) {
    goto LABEL_24;
  }
LABEL_12:
  if ((has & 0x200) == 0) {
    return;
  }
LABEL_25:

  PBDataWriterWriteUint64Field();
}

- (void)copyTo:(id)a3
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) != 0)
  {
    *((void *)a3 + 8) = self->_tkipmicfaill;
    *((_WORD *)a3 + 52) |= 0x80u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *((void *)a3 + 6) = self->_tkipcntrmsr;
  *((_WORD *)a3 + 52) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((void *)a3 + 9) = self->_tkipreplay;
  *((_WORD *)a3 + 52) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  *((void *)a3 + 1) = self->_ccmpfmterr;
  *((_WORD *)a3 + 52) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((void *)a3 + 2) = self->_ccmpreplay;
  *((_WORD *)a3 + 52) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((void *)a3 + 3) = self->_ccmpundec;
  *((_WORD *)a3 + 52) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x800) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((void *)a3 + 5) = self->_fourwayfail;
  *((_WORD *)a3 + 52) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_9:
    if ((has & 0x400) == 0) {
      goto LABEL_10;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((void *)a3 + 12) = self->_wepundec;
  *((_WORD *)a3 + 52) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_10:
    if ((has & 8) == 0) {
      goto LABEL_11;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((void *)a3 + 11) = self->_wepicverr;
  *((_WORD *)a3 + 52) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_11:
    if ((has & 0x40) == 0) {
      goto LABEL_12;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((void *)a3 + 4) = self->_decsuccess;
  *((_WORD *)a3 + 52) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_12:
    if ((has & 0x200) == 0) {
      return;
    }
LABEL_25:
    *((void *)a3 + 10) = self->_wepexcluded;
    *((_WORD *)a3 + 52) |= 0x200u;
    return;
  }
LABEL_24:
  *((void *)a3 + 7) = self->_tkipicverr;
  *((_WORD *)a3 + 52) |= 0x40u;
  if ((*(_WORD *)&self->_has & 0x200) != 0) {
    goto LABEL_25;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(id)[(id)[(id)objc_opt_class() allocWithZone:a3] init];
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) != 0)
  {
    *((void *)result + 8) = self->_tkipmicfaill;
    *((_WORD *)result + 52) |= 0x80u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *((void *)result + 6) = self->_tkipcntrmsr;
  *((_WORD *)result + 52) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
LABEL_17:
  *((void *)result + 9) = self->_tkipreplay;
  *((_WORD *)result + 52) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((void *)result + 1) = self->_ccmpfmterr;
  *((_WORD *)result + 52) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((void *)result + 2) = self->_ccmpreplay;
  *((_WORD *)result + 52) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((void *)result + 3) = self->_ccmpundec;
  *((_WORD *)result + 52) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x800) == 0) {
      goto LABEL_9;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((void *)result + 5) = self->_fourwayfail;
  *((_WORD *)result + 52) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_9:
    if ((has & 0x400) == 0) {
      goto LABEL_10;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((void *)result + 12) = self->_wepundec;
  *((_WORD *)result + 52) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_10:
    if ((has & 8) == 0) {
      goto LABEL_11;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((void *)result + 11) = self->_wepicverr;
  *((_WORD *)result + 52) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_11:
    if ((has & 0x40) == 0) {
      goto LABEL_12;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((void *)result + 4) = self->_decsuccess;
  *((_WORD *)result + 52) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_12:
    if ((has & 0x200) == 0) {
      return result;
    }
    goto LABEL_13;
  }
LABEL_25:
  *((void *)result + 7) = self->_tkipicverr;
  *((_WORD *)result + 52) |= 0x40u;
  if ((*(_WORD *)&self->_has & 0x200) == 0) {
    return result;
  }
LABEL_13:
  *((void *)result + 10) = self->_wepexcluded;
  *((_WORD *)result + 52) |= 0x200u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    __int16 has = (__int16)self->_has;
    __int16 v7 = *((_WORD *)a3 + 52);
    if ((has & 0x80) != 0)
    {
      if ((v7 & 0x80) == 0 || self->_tkipmicfaill != *((void *)a3 + 8)) {
        goto LABEL_61;
      }
    }
    else if ((v7 & 0x80) != 0)
    {
LABEL_61:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((has & 0x20) != 0)
    {
      if ((v7 & 0x20) == 0 || self->_tkipcntrmsr != *((void *)a3 + 6)) {
        goto LABEL_61;
      }
    }
    else if ((v7 & 0x20) != 0)
    {
      goto LABEL_61;
    }
    if ((*(_WORD *)&self->_has & 0x100) != 0)
    {
      if ((*((_WORD *)a3 + 52) & 0x100) == 0 || self->_tkipreplay != *((void *)a3 + 9)) {
        goto LABEL_61;
      }
    }
    else if ((*((_WORD *)a3 + 52) & 0x100) != 0)
    {
      goto LABEL_61;
    }
    if (has)
    {
      if ((v7 & 1) == 0 || self->_ccmpfmterr != *((void *)a3 + 1)) {
        goto LABEL_61;
      }
    }
    else if (v7)
    {
      goto LABEL_61;
    }
    if ((has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_ccmpreplay != *((void *)a3 + 2)) {
        goto LABEL_61;
      }
    }
    else if ((v7 & 2) != 0)
    {
      goto LABEL_61;
    }
    if ((has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_ccmpundec != *((void *)a3 + 3)) {
        goto LABEL_61;
      }
    }
    else if ((v7 & 4) != 0)
    {
      goto LABEL_61;
    }
    if ((has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_fourwayfail != *((void *)a3 + 5)) {
        goto LABEL_61;
      }
    }
    else if ((v7 & 0x10) != 0)
    {
      goto LABEL_61;
    }
    if ((*(_WORD *)&self->_has & 0x800) != 0)
    {
      if ((*((_WORD *)a3 + 52) & 0x800) == 0 || self->_wepundec != *((void *)a3 + 12)) {
        goto LABEL_61;
      }
    }
    else if ((*((_WORD *)a3 + 52) & 0x800) != 0)
    {
      goto LABEL_61;
    }
    if ((*(_WORD *)&self->_has & 0x400) != 0)
    {
      if ((*((_WORD *)a3 + 52) & 0x400) == 0 || self->_wepicverr != *((void *)a3 + 11)) {
        goto LABEL_61;
      }
    }
    else if ((*((_WORD *)a3 + 52) & 0x400) != 0)
    {
      goto LABEL_61;
    }
    if ((has & 8) != 0)
    {
      if ((v7 & 8) == 0 || self->_decsuccess != *((void *)a3 + 4)) {
        goto LABEL_61;
      }
    }
    else if ((v7 & 8) != 0)
    {
      goto LABEL_61;
    }
    if ((has & 0x40) != 0)
    {
      if ((v7 & 0x40) == 0 || self->_tkipicverr != *((void *)a3 + 7)) {
        goto LABEL_61;
      }
    }
    else if ((v7 & 0x40) != 0)
    {
      goto LABEL_61;
    }
    LOBYTE(v5) = (v7 & 0x200) == 0;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
    {
      if ((*((_WORD *)a3 + 52) & 0x200) == 0 || self->_wepexcluded != *((void *)a3 + 10)) {
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
  if ((has & 0x80) != 0)
  {
    unint64_t v3 = 2654435761u * self->_tkipmicfaill;
    if ((has & 0x20) != 0)
    {
LABEL_3:
      unint64_t v4 = 2654435761u * self->_tkipcntrmsr;
      if ((*(_WORD *)&self->_has & 0x100) != 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else
  {
    unint64_t v3 = 0;
    if ((has & 0x20) != 0) {
      goto LABEL_3;
    }
  }
  unint64_t v4 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_4:
    unint64_t v5 = 2654435761u * self->_tkipreplay;
    if (has) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  unint64_t v5 = 0;
  if (has)
  {
LABEL_5:
    unint64_t v6 = 2654435761u * self->_ccmpfmterr;
    if ((has & 2) != 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  unint64_t v6 = 0;
  if ((has & 2) != 0)
  {
LABEL_6:
    unint64_t v7 = 2654435761u * self->_ccmpreplay;
    if ((has & 4) != 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  unint64_t v7 = 0;
  if ((has & 4) != 0)
  {
LABEL_7:
    unint64_t v8 = 2654435761u * self->_ccmpundec;
    if ((has & 0x10) != 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  unint64_t v8 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_8:
    unint64_t v9 = 2654435761u * self->_fourwayfail;
    if ((*(_WORD *)&self->_has & 0x800) != 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  unint64_t v9 = 0;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_9:
    unint64_t v10 = 2654435761u * self->_wepundec;
    if ((*(_WORD *)&self->_has & 0x400) != 0) {
      goto LABEL_10;
    }
    goto LABEL_22;
  }
LABEL_21:
  unint64_t v10 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_10:
    unint64_t v11 = 2654435761u * self->_wepicverr;
    if ((has & 8) != 0) {
      goto LABEL_11;
    }
    goto LABEL_23;
  }
LABEL_22:
  unint64_t v11 = 0;
  if ((has & 8) != 0)
  {
LABEL_11:
    unint64_t v12 = 2654435761u * self->_decsuccess;
    if ((has & 0x40) != 0) {
      goto LABEL_12;
    }
LABEL_24:
    unint64_t v13 = 0;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_13;
    }
LABEL_25:
    unint64_t v14 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14;
  }
LABEL_23:
  unint64_t v12 = 0;
  if ((has & 0x40) == 0) {
    goto LABEL_24;
  }
LABEL_12:
  unint64_t v13 = 2654435761u * self->_tkipicverr;
  if ((*(_WORD *)&self->_has & 0x200) == 0) {
    goto LABEL_25;
  }
LABEL_13:
  unint64_t v14 = 2654435761u * self->_wepexcluded;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14;
}

- (void)mergeFrom:(id)a3
{
  __int16 v3 = *((_WORD *)a3 + 52);
  if ((v3 & 0x80) != 0)
  {
    self->_tkipmicfaill = *((void *)a3 + 8);
    *(_WORD *)&self->_has |= 0x80u;
    __int16 v3 = *((_WORD *)a3 + 52);
    if ((v3 & 0x20) == 0)
    {
LABEL_3:
      if ((v3 & 0x100) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((v3 & 0x20) == 0)
  {
    goto LABEL_3;
  }
  self->_tkipcntrmsr = *((void *)a3 + 6);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v3 = *((_WORD *)a3 + 52);
  if ((v3 & 0x100) == 0)
  {
LABEL_4:
    if ((v3 & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  self->_tkipreplay = *((void *)a3 + 9);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v3 = *((_WORD *)a3 + 52);
  if ((v3 & 1) == 0)
  {
LABEL_5:
    if ((v3 & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  self->_ccmpfmterr = *((void *)a3 + 1);
  *(_WORD *)&self->_has |= 1u;
  __int16 v3 = *((_WORD *)a3 + 52);
  if ((v3 & 2) == 0)
  {
LABEL_6:
    if ((v3 & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  self->_ccmpreplay = *((void *)a3 + 2);
  *(_WORD *)&self->_has |= 2u;
  __int16 v3 = *((_WORD *)a3 + 52);
  if ((v3 & 4) == 0)
  {
LABEL_7:
    if ((v3 & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  self->_ccmpundec = *((void *)a3 + 3);
  *(_WORD *)&self->_has |= 4u;
  __int16 v3 = *((_WORD *)a3 + 52);
  if ((v3 & 0x10) == 0)
  {
LABEL_8:
    if ((v3 & 0x800) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  self->_fourwayfail = *((void *)a3 + 5);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v3 = *((_WORD *)a3 + 52);
  if ((v3 & 0x800) == 0)
  {
LABEL_9:
    if ((v3 & 0x400) == 0) {
      goto LABEL_10;
    }
    goto LABEL_22;
  }
LABEL_21:
  self->_wepundec = *((void *)a3 + 12);
  *(_WORD *)&self->_has |= 0x800u;
  __int16 v3 = *((_WORD *)a3 + 52);
  if ((v3 & 0x400) == 0)
  {
LABEL_10:
    if ((v3 & 8) == 0) {
      goto LABEL_11;
    }
    goto LABEL_23;
  }
LABEL_22:
  self->_wepicverr = *((void *)a3 + 11);
  *(_WORD *)&self->_has |= 0x400u;
  __int16 v3 = *((_WORD *)a3 + 52);
  if ((v3 & 8) == 0)
  {
LABEL_11:
    if ((v3 & 0x40) == 0) {
      goto LABEL_12;
    }
    goto LABEL_24;
  }
LABEL_23:
  self->_decsuccess = *((void *)a3 + 4);
  *(_WORD *)&self->_has |= 8u;
  __int16 v3 = *((_WORD *)a3 + 52);
  if ((v3 & 0x40) == 0)
  {
LABEL_12:
    if ((v3 & 0x200) == 0) {
      return;
    }
LABEL_25:
    self->_wepexcluded = *((void *)a3 + 10);
    *(_WORD *)&self->_has |= 0x200u;
    return;
  }
LABEL_24:
  self->_tkipicverr = *((void *)a3 + 7);
  *(_WORD *)&self->_has |= 0x40u;
  if ((*((_WORD *)a3 + 52) & 0x200) != 0) {
    goto LABEL_25;
  }
}

- (unint64_t)tkipmicfaill
{
  return self->_tkipmicfaill;
}

- (unint64_t)tkipcntrmsr
{
  return self->_tkipcntrmsr;
}

- (unint64_t)tkipreplay
{
  return self->_tkipreplay;
}

- (unint64_t)ccmpfmterr
{
  return self->_ccmpfmterr;
}

- (unint64_t)ccmpreplay
{
  return self->_ccmpreplay;
}

- (unint64_t)ccmpundec
{
  return self->_ccmpundec;
}

- (unint64_t)fourwayfail
{
  return self->_fourwayfail;
}

- (unint64_t)wepundec
{
  return self->_wepundec;
}

- (unint64_t)wepicverr
{
  return self->_wepicverr;
}

- (unint64_t)decsuccess
{
  return self->_decsuccess;
}

- (unint64_t)tkipicverr
{
  return self->_tkipicverr;
}

- (unint64_t)wepexcluded
{
  return self->_wepexcluded;
}

@end