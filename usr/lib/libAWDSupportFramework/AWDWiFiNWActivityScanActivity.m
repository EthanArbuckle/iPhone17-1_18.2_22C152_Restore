@interface AWDWiFiNWActivityScanActivity
- (BOOL)hasAssocCount;
- (BOOL)hasAssocDur;
- (BOOL)hasOtherCount;
- (BOOL)hasOtherDur;
- (BOOL)hasPnoBSSIDCount;
- (BOOL)hasPnoBSSIDDur;
- (BOOL)hasPnoSSIDCount;
- (BOOL)hasPnoSSIDDur;
- (BOOL)hasRoamCount;
- (BOOL)hasRoamDur;
- (BOOL)hasUserCount;
- (BOOL)hasUserDur;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)assocCount;
- (unsigned)assocDur;
- (unsigned)otherCount;
- (unsigned)otherDur;
- (unsigned)pnoBSSIDCount;
- (unsigned)pnoBSSIDDur;
- (unsigned)pnoSSIDCount;
- (unsigned)pnoSSIDDur;
- (unsigned)roamCount;
- (unsigned)roamDur;
- (unsigned)userCount;
- (unsigned)userDur;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAssocCount:(unsigned int)a3;
- (void)setAssocDur:(unsigned int)a3;
- (void)setHasAssocCount:(BOOL)a3;
- (void)setHasAssocDur:(BOOL)a3;
- (void)setHasOtherCount:(BOOL)a3;
- (void)setHasOtherDur:(BOOL)a3;
- (void)setHasPnoBSSIDCount:(BOOL)a3;
- (void)setHasPnoBSSIDDur:(BOOL)a3;
- (void)setHasPnoSSIDCount:(BOOL)a3;
- (void)setHasPnoSSIDDur:(BOOL)a3;
- (void)setHasRoamCount:(BOOL)a3;
- (void)setHasRoamDur:(BOOL)a3;
- (void)setHasUserCount:(BOOL)a3;
- (void)setHasUserDur:(BOOL)a3;
- (void)setOtherCount:(unsigned int)a3;
- (void)setOtherDur:(unsigned int)a3;
- (void)setPnoBSSIDCount:(unsigned int)a3;
- (void)setPnoBSSIDDur:(unsigned int)a3;
- (void)setPnoSSIDCount:(unsigned int)a3;
- (void)setPnoSSIDDur:(unsigned int)a3;
- (void)setRoamCount:(unsigned int)a3;
- (void)setRoamDur:(unsigned int)a3;
- (void)setUserCount:(unsigned int)a3;
- (void)setUserDur:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDWiFiNWActivityScanActivity

- (void)setUserCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_userCount = a3;
}

- (void)setHasUserCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasUserCount
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setUserDur:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_userDur = a3;
}

- (void)setHasUserDur:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasUserDur
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setRoamCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_roamCount = a3;
}

- (void)setHasRoamCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasRoamCount
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setRoamDur:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_roamDur = a3;
}

- (void)setHasRoamDur:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasRoamDur
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setAssocCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_assocCount = a3;
}

- (void)setHasAssocCount:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasAssocCount
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setAssocDur:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_assocDur = a3;
}

- (void)setHasAssocDur:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasAssocDur
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setPnoBSSIDCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_pnoBSSIDCount = a3;
}

- (void)setHasPnoBSSIDCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasPnoBSSIDCount
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setPnoBSSIDDur:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_pnoBSSIDDur = a3;
}

- (void)setHasPnoBSSIDDur:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasPnoBSSIDDur
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setPnoSSIDCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_pnoSSIDCount = a3;
}

- (void)setHasPnoSSIDCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasPnoSSIDCount
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setPnoSSIDDur:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_pnoSSIDDur = a3;
}

- (void)setHasPnoSSIDDur:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasPnoSSIDDur
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setOtherCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_otherCount = a3;
}

- (void)setHasOtherCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasOtherCount
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setOtherDur:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_otherDur = a3;
}

- (void)setHasOtherDur:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasOtherDur
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiNWActivityScanActivity;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWiFiNWActivityScanActivity description](&v3, sel_description), -[AWDWiFiNWActivityScanActivity dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_userCount] forKey:@"userCount"];
    __int16 has = (__int16)self->_has;
    if ((has & 0x800) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_userDur] forKey:@"userDur"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 0x200) == 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
LABEL_17:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_roamCount] forKey:@"roamCount"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_5:
    if ((has & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_19;
  }
LABEL_18:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_roamDur] forKey:@"roamDur"];
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_20;
  }
LABEL_19:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_assocCount] forKey:@"assocCount"];
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_21;
  }
LABEL_20:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_assocDur] forKey:@"assocDur"];
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
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_pnoBSSIDCount] forKey:@"pnoBSSIDCount"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 0x40) == 0) {
      goto LABEL_10;
    }
    goto LABEL_23;
  }
LABEL_22:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_pnoBSSIDDur] forKey:@"pnoBSSIDDur"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_10:
    if ((has & 0x80) == 0) {
      goto LABEL_11;
    }
    goto LABEL_24;
  }
LABEL_23:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_pnoSSIDCount] forKey:@"pnoSSIDCount"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_11:
    if ((has & 4) == 0) {
      goto LABEL_12;
    }
LABEL_25:
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_otherCount] forKey:@"otherCount"];
    if ((*(_WORD *)&self->_has & 8) == 0) {
      return v3;
    }
    goto LABEL_13;
  }
LABEL_24:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_pnoSSIDDur] forKey:@"pnoSSIDDur"];
  __int16 has = (__int16)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_25;
  }
LABEL_12:
  if ((has & 8) != 0) {
LABEL_13:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_otherDur] forKey:@"otherDur"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiNWActivityScanActivityReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) != 0)
  {
    PBDataWriterWriteUint32Field();
    __int16 has = (__int16)self->_has;
    if ((has & 0x800) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0) {
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
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 0x200) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_5:
    if ((has & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
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
    if ((has & 0x40) == 0) {
      goto LABEL_10;
    }
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_10:
    if ((has & 0x80) == 0) {
      goto LABEL_11;
    }
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_11:
    if ((has & 4) == 0) {
      goto LABEL_12;
    }
LABEL_24:
    PBDataWriterWriteUint32Field();
    if ((*(_WORD *)&self->_has & 8) == 0) {
      return;
    }
    goto LABEL_25;
  }
LABEL_23:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_24;
  }
LABEL_12:
  if ((has & 8) == 0) {
    return;
  }
LABEL_25:

  PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) != 0)
  {
    *((_DWORD *)a3 + 12) = self->_userCount;
    *((_WORD *)a3 + 28) |= 0x400u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x800) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 13) = self->_userDur;
  *((_WORD *)a3 + 28) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 0x200) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)a3 + 10) = self->_roamCount;
  *((_WORD *)a3 + 28) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_5:
    if ((has & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)a3 + 11) = self->_roamDur;
  *((_WORD *)a3 + 28) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)a3 + 2) = self->_assocCount;
  *((_WORD *)a3 + 28) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)a3 + 3) = self->_assocDur;
  *((_WORD *)a3 + 28) |= 2u;
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
  *((_DWORD *)a3 + 6) = self->_pnoBSSIDCount;
  *((_WORD *)a3 + 28) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 0x40) == 0) {
      goto LABEL_10;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)a3 + 7) = self->_pnoBSSIDDur;
  *((_WORD *)a3 + 28) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_10:
    if ((has & 0x80) == 0) {
      goto LABEL_11;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)a3 + 8) = self->_pnoSSIDCount;
  *((_WORD *)a3 + 28) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_11:
    if ((has & 4) == 0) {
      goto LABEL_12;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)a3 + 9) = self->_pnoSSIDDur;
  *((_WORD *)a3 + 28) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_12:
    if ((has & 8) == 0) {
      return;
    }
LABEL_25:
    *((_DWORD *)a3 + 5) = self->_otherDur;
    *((_WORD *)a3 + 28) |= 8u;
    return;
  }
LABEL_24:
  *((_DWORD *)a3 + 4) = self->_otherCount;
  *((_WORD *)a3 + 28) |= 4u;
  if ((*(_WORD *)&self->_has & 8) != 0) {
    goto LABEL_25;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(id)[(id)[(id)objc_opt_class() allocWithZone:a3] init];
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) != 0)
  {
    *((_DWORD *)result + 12) = self->_userCount;
    *((_WORD *)result + 28) |= 0x400u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x800) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 13) = self->_userDur;
  *((_WORD *)result + 28) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 0x200) == 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)result + 10) = self->_roamCount;
  *((_WORD *)result + 28) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_5:
    if ((has & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)result + 11) = self->_roamDur;
  *((_WORD *)result + 28) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)result + 2) = self->_assocCount;
  *((_WORD *)result + 28) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)result + 3) = self->_assocDur;
  *((_WORD *)result + 28) |= 2u;
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
  *((_DWORD *)result + 6) = self->_pnoBSSIDCount;
  *((_WORD *)result + 28) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 0x40) == 0) {
      goto LABEL_10;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)result + 7) = self->_pnoBSSIDDur;
  *((_WORD *)result + 28) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_10:
    if ((has & 0x80) == 0) {
      goto LABEL_11;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)result + 8) = self->_pnoSSIDCount;
  *((_WORD *)result + 28) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_11:
    if ((has & 4) == 0) {
      goto LABEL_12;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)result + 9) = self->_pnoSSIDDur;
  *((_WORD *)result + 28) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_12:
    if ((has & 8) == 0) {
      return result;
    }
    goto LABEL_13;
  }
LABEL_25:
  *((_DWORD *)result + 4) = self->_otherCount;
  *((_WORD *)result + 28) |= 4u;
  if ((*(_WORD *)&self->_has & 8) == 0) {
    return result;
  }
LABEL_13:
  *((_DWORD *)result + 5) = self->_otherDur;
  *((_WORD *)result + 28) |= 8u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    __int16 has = (__int16)self->_has;
    __int16 v7 = *((_WORD *)a3 + 28);
    if ((has & 0x400) != 0)
    {
      if ((*((_WORD *)a3 + 28) & 0x400) == 0 || self->_userCount != *((_DWORD *)a3 + 12)) {
        goto LABEL_61;
      }
    }
    else if ((*((_WORD *)a3 + 28) & 0x400) != 0)
    {
LABEL_61:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_WORD *)&self->_has & 0x800) != 0)
    {
      if ((*((_WORD *)a3 + 28) & 0x800) == 0 || self->_userDur != *((_DWORD *)a3 + 13)) {
        goto LABEL_61;
      }
    }
    else if ((*((_WORD *)a3 + 28) & 0x800) != 0)
    {
      goto LABEL_61;
    }
    if ((*(_WORD *)&self->_has & 0x100) != 0)
    {
      if ((*((_WORD *)a3 + 28) & 0x100) == 0 || self->_roamCount != *((_DWORD *)a3 + 10)) {
        goto LABEL_61;
      }
    }
    else if ((*((_WORD *)a3 + 28) & 0x100) != 0)
    {
      goto LABEL_61;
    }
    if ((*(_WORD *)&self->_has & 0x200) != 0)
    {
      if ((*((_WORD *)a3 + 28) & 0x200) == 0 || self->_roamDur != *((_DWORD *)a3 + 11)) {
        goto LABEL_61;
      }
    }
    else if ((*((_WORD *)a3 + 28) & 0x200) != 0)
    {
      goto LABEL_61;
    }
    if (has)
    {
      if ((v7 & 1) == 0 || self->_assocCount != *((_DWORD *)a3 + 2)) {
        goto LABEL_61;
      }
    }
    else if (v7)
    {
      goto LABEL_61;
    }
    if ((has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_assocDur != *((_DWORD *)a3 + 3)) {
        goto LABEL_61;
      }
    }
    else if ((v7 & 2) != 0)
    {
      goto LABEL_61;
    }
    if ((has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_pnoBSSIDCount != *((_DWORD *)a3 + 6)) {
        goto LABEL_61;
      }
    }
    else if ((v7 & 0x10) != 0)
    {
      goto LABEL_61;
    }
    if ((has & 0x20) != 0)
    {
      if ((v7 & 0x20) == 0 || self->_pnoBSSIDDur != *((_DWORD *)a3 + 7)) {
        goto LABEL_61;
      }
    }
    else if ((v7 & 0x20) != 0)
    {
      goto LABEL_61;
    }
    if ((has & 0x40) != 0)
    {
      if ((v7 & 0x40) == 0 || self->_pnoSSIDCount != *((_DWORD *)a3 + 8)) {
        goto LABEL_61;
      }
    }
    else if ((v7 & 0x40) != 0)
    {
      goto LABEL_61;
    }
    if ((has & 0x80) != 0)
    {
      if ((v7 & 0x80) == 0 || self->_pnoSSIDDur != *((_DWORD *)a3 + 9)) {
        goto LABEL_61;
      }
    }
    else if ((v7 & 0x80) != 0)
    {
      goto LABEL_61;
    }
    if ((has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_otherCount != *((_DWORD *)a3 + 4)) {
        goto LABEL_61;
      }
    }
    else if ((v7 & 4) != 0)
    {
      goto LABEL_61;
    }
    LOBYTE(v5) = (v7 & 8) == 0;
    if ((has & 8) != 0)
    {
      if ((v7 & 8) == 0 || self->_otherDur != *((_DWORD *)a3 + 5)) {
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
  if ((has & 0x400) != 0)
  {
    uint64_t v3 = 2654435761 * self->_userCount;
    if ((*(_WORD *)&self->_has & 0x800) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_userDur;
      if ((*(_WORD *)&self->_has & 0x100) != 0) {
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
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_roamCount;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v5 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_roamDur;
    if (has) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v6 = 0;
  if (has)
  {
LABEL_6:
    uint64_t v7 = 2654435761 * self->_assocCount;
    if ((has & 2) != 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v7 = 0;
  if ((has & 2) != 0)
  {
LABEL_7:
    uint64_t v8 = 2654435761 * self->_assocDur;
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
    uint64_t v9 = 2654435761 * self->_pnoBSSIDCount;
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
    uint64_t v10 = 2654435761 * self->_pnoBSSIDDur;
    if ((has & 0x40) != 0) {
      goto LABEL_10;
    }
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v10 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_10:
    uint64_t v11 = 2654435761 * self->_pnoSSIDCount;
    if ((has & 0x80) != 0) {
      goto LABEL_11;
    }
    goto LABEL_23;
  }
LABEL_22:
  uint64_t v11 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_11:
    uint64_t v12 = 2654435761 * self->_pnoSSIDDur;
    if ((has & 4) != 0) {
      goto LABEL_12;
    }
LABEL_24:
    uint64_t v13 = 0;
    if ((has & 8) != 0) {
      goto LABEL_13;
    }
LABEL_25:
    uint64_t v14 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14;
  }
LABEL_23:
  uint64_t v12 = 0;
  if ((has & 4) == 0) {
    goto LABEL_24;
  }
LABEL_12:
  uint64_t v13 = 2654435761 * self->_otherCount;
  if ((has & 8) == 0) {
    goto LABEL_25;
  }
LABEL_13:
  uint64_t v14 = 2654435761 * self->_otherDur;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14;
}

- (void)mergeFrom:(id)a3
{
  __int16 v3 = *((_WORD *)a3 + 28);
  if ((v3 & 0x400) != 0)
  {
    self->_userCount = *((_DWORD *)a3 + 12);
    *(_WORD *)&self->_has |= 0x400u;
    __int16 v3 = *((_WORD *)a3 + 28);
    if ((v3 & 0x800) == 0)
    {
LABEL_3:
      if ((v3 & 0x100) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((*((_WORD *)a3 + 28) & 0x800) == 0)
  {
    goto LABEL_3;
  }
  self->_userDur = *((_DWORD *)a3 + 13);
  *(_WORD *)&self->_has |= 0x800u;
  __int16 v3 = *((_WORD *)a3 + 28);
  if ((v3 & 0x100) == 0)
  {
LABEL_4:
    if ((v3 & 0x200) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  self->_roamCount = *((_DWORD *)a3 + 10);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v3 = *((_WORD *)a3 + 28);
  if ((v3 & 0x200) == 0)
  {
LABEL_5:
    if ((v3 & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  self->_roamDur = *((_DWORD *)a3 + 11);
  *(_WORD *)&self->_has |= 0x200u;
  __int16 v3 = *((_WORD *)a3 + 28);
  if ((v3 & 1) == 0)
  {
LABEL_6:
    if ((v3 & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  self->_assocCount = *((_DWORD *)a3 + 2);
  *(_WORD *)&self->_has |= 1u;
  __int16 v3 = *((_WORD *)a3 + 28);
  if ((v3 & 2) == 0)
  {
LABEL_7:
    if ((v3 & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  self->_assocDur = *((_DWORD *)a3 + 3);
  *(_WORD *)&self->_has |= 2u;
  __int16 v3 = *((_WORD *)a3 + 28);
  if ((v3 & 0x10) == 0)
  {
LABEL_8:
    if ((v3 & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  self->_pnoBSSIDCount = *((_DWORD *)a3 + 6);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v3 = *((_WORD *)a3 + 28);
  if ((v3 & 0x20) == 0)
  {
LABEL_9:
    if ((v3 & 0x40) == 0) {
      goto LABEL_10;
    }
    goto LABEL_22;
  }
LABEL_21:
  self->_pnoBSSIDDur = *((_DWORD *)a3 + 7);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v3 = *((_WORD *)a3 + 28);
  if ((v3 & 0x40) == 0)
  {
LABEL_10:
    if ((v3 & 0x80) == 0) {
      goto LABEL_11;
    }
    goto LABEL_23;
  }
LABEL_22:
  self->_pnoSSIDCount = *((_DWORD *)a3 + 8);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v3 = *((_WORD *)a3 + 28);
  if ((v3 & 0x80) == 0)
  {
LABEL_11:
    if ((v3 & 4) == 0) {
      goto LABEL_12;
    }
    goto LABEL_24;
  }
LABEL_23:
  self->_pnoSSIDDur = *((_DWORD *)a3 + 9);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v3 = *((_WORD *)a3 + 28);
  if ((v3 & 4) == 0)
  {
LABEL_12:
    if ((v3 & 8) == 0) {
      return;
    }
LABEL_25:
    self->_otherDur = *((_DWORD *)a3 + 5);
    *(_WORD *)&self->_has |= 8u;
    return;
  }
LABEL_24:
  self->_otherCount = *((_DWORD *)a3 + 4);
  *(_WORD *)&self->_has |= 4u;
  if ((*((_WORD *)a3 + 28) & 8) != 0) {
    goto LABEL_25;
  }
}

- (unsigned)userCount
{
  return self->_userCount;
}

- (unsigned)userDur
{
  return self->_userDur;
}

- (unsigned)roamCount
{
  return self->_roamCount;
}

- (unsigned)roamDur
{
  return self->_roamDur;
}

- (unsigned)assocCount
{
  return self->_assocCount;
}

- (unsigned)assocDur
{
  return self->_assocDur;
}

- (unsigned)pnoBSSIDCount
{
  return self->_pnoBSSIDCount;
}

- (unsigned)pnoBSSIDDur
{
  return self->_pnoBSSIDDur;
}

- (unsigned)pnoSSIDCount
{
  return self->_pnoSSIDCount;
}

- (unsigned)pnoSSIDDur
{
  return self->_pnoSSIDDur;
}

- (unsigned)otherCount
{
  return self->_otherCount;
}

- (unsigned)otherDur
{
  return self->_otherDur;
}

@end