@interface WiFiAnalyticsAWDWiFiNWActivityScanActivity
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

@implementation WiFiAnalyticsAWDWiFiNWActivityScanActivity

- (void)writeTo:(id)a3
{
  id v5 = a3;
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
      goto LABEL_19;
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
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_5:
    if ((has & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 0x40) == 0) {
      goto LABEL_10;
    }
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_10:
    if ((has & 0x80) == 0) {
      goto LABEL_11;
    }
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_11:
    if ((has & 4) == 0) {
      goto LABEL_12;
    }
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_12:
    if ((has & 8) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_27:
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 8) != 0) {
LABEL_13:
  }
    PBDataWriterWriteUint32Field();
LABEL_14:
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) != 0)
  {
    v7 = [NSNumber numberWithUnsignedInt:self->_userCount];
    [v3 setObject:v7 forKey:@"userCount"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x800) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_3;
  }
  v8 = [NSNumber numberWithUnsignedInt:self->_userDur];
  [v3 setObject:v8 forKey:@"userDur"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 0x200) == 0) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }
LABEL_19:
  v9 = [NSNumber numberWithUnsignedInt:self->_roamCount];
  [v3 setObject:v9 forKey:@"roamCount"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_5:
    if ((has & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_21;
  }
LABEL_20:
  v10 = [NSNumber numberWithUnsignedInt:self->_roamDur];
  [v3 setObject:v10 forKey:@"roamDur"];

  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_22;
  }
LABEL_21:
  v11 = [NSNumber numberWithUnsignedInt:self->_assocCount];
  [v3 setObject:v11 forKey:@"assocCount"];

  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_23;
  }
LABEL_22:
  v12 = [NSNumber numberWithUnsignedInt:self->_assocDur];
  [v3 setObject:v12 forKey:@"assocDur"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_24;
  }
LABEL_23:
  v13 = [NSNumber numberWithUnsignedInt:self->_pnoBSSIDCount];
  [v3 setObject:v13 forKey:@"pnoBSSIDCount"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 0x40) == 0) {
      goto LABEL_10;
    }
    goto LABEL_25;
  }
LABEL_24:
  v14 = [NSNumber numberWithUnsignedInt:self->_pnoBSSIDDur];
  [v3 setObject:v14 forKey:@"pnoBSSIDDur"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_10:
    if ((has & 0x80) == 0) {
      goto LABEL_11;
    }
    goto LABEL_26;
  }
LABEL_25:
  v15 = [NSNumber numberWithUnsignedInt:self->_pnoSSIDCount];
  [v3 setObject:v15 forKey:@"pnoSSIDCount"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_11:
    if ((has & 4) == 0) {
      goto LABEL_12;
    }
    goto LABEL_27;
  }
LABEL_26:
  v16 = [NSNumber numberWithUnsignedInt:self->_pnoSSIDDur];
  [v3 setObject:v16 forKey:@"pnoSSIDDur"];

  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_12:
    if ((has & 8) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_27:
  v17 = [NSNumber numberWithUnsignedInt:self->_otherCount];
  [v3 setObject:v17 forKey:@"otherCount"];

  if ((*(_WORD *)&self->_has & 8) != 0)
  {
LABEL_13:
    id v5 = [NSNumber numberWithUnsignedInt:self->_otherDur];
    [v3 setObject:v5 forKey:@"otherDur"];
  }
LABEL_14:
  return v3;
}

- (void)setUserDur:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_userDur = a3;
}

- (void)setUserCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_userCount = a3;
}

- (void)setRoamDur:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_roamDur = a3;
}

- (void)setRoamCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_roamCount = a3;
}

- (void)setPnoSSIDDur:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_pnoSSIDDur = a3;
}

- (void)setPnoSSIDCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_pnoSSIDCount = a3;
}

- (void)setPnoBSSIDDur:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_pnoBSSIDDur = a3;
}

- (void)setPnoBSSIDCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_pnoBSSIDCount = a3;
}

- (void)setOtherDur:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_otherDur = a3;
}

- (void)setOtherCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_otherCount = a3;
}

- (void)setAssocDur:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_assocDur = a3;
}

- (void)setAssocCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_assocCount = a3;
}

- (void)setHasUserCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasUserCount
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setHasUserDur:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasUserDur
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setHasRoamCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasRoamCount
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setHasRoamDur:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasRoamDur
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setHasAssocCount:(BOOL)a3
{
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasAssocCount
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setHasAssocDur:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasAssocDur
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setHasPnoBSSIDCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasPnoBSSIDCount
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setHasPnoBSSIDDur:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasPnoBSSIDDur
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setHasPnoSSIDCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasPnoSSIDCount
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setHasPnoSSIDDur:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasPnoSSIDDur
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setHasOtherCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasOtherCount
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setHasOtherDur:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasOtherDur
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (id)description
{
  __int16 v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)WiFiAnalyticsAWDWiFiNWActivityScanActivity;
  v4 = [(WiFiAnalyticsAWDWiFiNWActivityScanActivity *)&v8 description];
  id v5 = [(WiFiAnalyticsAWDWiFiNWActivityScanActivity *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return WiFiAnalyticsAWDWiFiNWActivityScanActivityReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) != 0)
  {
    v4[12] = self->_userCount;
    *((_WORD *)v4 + 28) |= 0x400u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x800) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_3;
  }
  v4[13] = self->_userDur;
  *((_WORD *)v4 + 28) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 0x200) == 0) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }
LABEL_19:
  v4[10] = self->_roamCount;
  *((_WORD *)v4 + 28) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_5:
    if ((has & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_21;
  }
LABEL_20:
  v4[11] = self->_roamDur;
  *((_WORD *)v4 + 28) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_22;
  }
LABEL_21:
  v4[2] = self->_assocCount;
  *((_WORD *)v4 + 28) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_23;
  }
LABEL_22:
  v4[3] = self->_assocDur;
  *((_WORD *)v4 + 28) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_24;
  }
LABEL_23:
  v4[6] = self->_pnoBSSIDCount;
  *((_WORD *)v4 + 28) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 0x40) == 0) {
      goto LABEL_10;
    }
    goto LABEL_25;
  }
LABEL_24:
  v4[7] = self->_pnoBSSIDDur;
  *((_WORD *)v4 + 28) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_10:
    if ((has & 0x80) == 0) {
      goto LABEL_11;
    }
    goto LABEL_26;
  }
LABEL_25:
  v4[8] = self->_pnoSSIDCount;
  *((_WORD *)v4 + 28) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_11:
    if ((has & 4) == 0) {
      goto LABEL_12;
    }
    goto LABEL_27;
  }
LABEL_26:
  v4[9] = self->_pnoSSIDDur;
  *((_WORD *)v4 + 28) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_12:
    if ((has & 8) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_27:
  v4[4] = self->_otherCount;
  *((_WORD *)v4 + 28) |= 4u;
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
LABEL_13:
    v4[5] = self->_otherDur;
    *((_WORD *)v4 + 28) |= 8u;
  }
LABEL_14:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
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
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_62;
  }
  __int16 has = (__int16)self->_has;
  __int16 v6 = *((_WORD *)v4 + 28);
  if ((has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 28) & 0x400) == 0 || self->_userCount != *((_DWORD *)v4 + 12)) {
      goto LABEL_62;
    }
  }
  else if ((*((_WORD *)v4 + 28) & 0x400) != 0)
  {
LABEL_62:
    BOOL v7 = 0;
    goto LABEL_63;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 28) & 0x800) == 0 || self->_userDur != *((_DWORD *)v4 + 13)) {
      goto LABEL_62;
    }
  }
  else if ((*((_WORD *)v4 + 28) & 0x800) != 0)
  {
    goto LABEL_62;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 28) & 0x100) == 0 || self->_roamCount != *((_DWORD *)v4 + 10)) {
      goto LABEL_62;
    }
  }
  else if ((*((_WORD *)v4 + 28) & 0x100) != 0)
  {
    goto LABEL_62;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 28) & 0x200) == 0 || self->_roamDur != *((_DWORD *)v4 + 11)) {
      goto LABEL_62;
    }
  }
  else if ((*((_WORD *)v4 + 28) & 0x200) != 0)
  {
    goto LABEL_62;
  }
  if (has)
  {
    if ((v6 & 1) == 0 || self->_assocCount != *((_DWORD *)v4 + 2)) {
      goto LABEL_62;
    }
  }
  else if (v6)
  {
    goto LABEL_62;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_assocDur != *((_DWORD *)v4 + 3)) {
      goto LABEL_62;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_62;
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_pnoBSSIDCount != *((_DWORD *)v4 + 6)) {
      goto LABEL_62;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_62;
  }
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_pnoBSSIDDur != *((_DWORD *)v4 + 7)) {
      goto LABEL_62;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_62;
  }
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_pnoSSIDCount != *((_DWORD *)v4 + 8)) {
      goto LABEL_62;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_62;
  }
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_pnoSSIDDur != *((_DWORD *)v4 + 9)) {
      goto LABEL_62;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_62;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_otherCount != *((_DWORD *)v4 + 4)) {
      goto LABEL_62;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_62;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_otherDur != *((_DWORD *)v4 + 5)) {
      goto LABEL_62;
    }
    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = (v6 & 8) == 0;
  }
LABEL_63:

  return v7;
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
  id v4 = a3;
  __int16 v5 = *((_WORD *)v4 + 28);
  if ((v5 & 0x400) != 0)
  {
    self->_userCount = *((_DWORD *)v4 + 12);
    *(_WORD *)&self->_has |= 0x400u;
    __int16 v5 = *((_WORD *)v4 + 28);
    if ((v5 & 0x800) == 0)
    {
LABEL_3:
      if ((v5 & 0x100) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else if ((*((_WORD *)v4 + 28) & 0x800) == 0)
  {
    goto LABEL_3;
  }
  self->_userDur = *((_DWORD *)v4 + 13);
  *(_WORD *)&self->_has |= 0x800u;
  __int16 v5 = *((_WORD *)v4 + 28);
  if ((v5 & 0x100) == 0)
  {
LABEL_4:
    if ((v5 & 0x200) == 0) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }
LABEL_19:
  self->_roamCount = *((_DWORD *)v4 + 10);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v5 = *((_WORD *)v4 + 28);
  if ((v5 & 0x200) == 0)
  {
LABEL_5:
    if ((v5 & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_21;
  }
LABEL_20:
  self->_roamDur = *((_DWORD *)v4 + 11);
  *(_WORD *)&self->_has |= 0x200u;
  __int16 v5 = *((_WORD *)v4 + 28);
  if ((v5 & 1) == 0)
  {
LABEL_6:
    if ((v5 & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_22;
  }
LABEL_21:
  self->_assocCount = *((_DWORD *)v4 + 2);
  *(_WORD *)&self->_has |= 1u;
  __int16 v5 = *((_WORD *)v4 + 28);
  if ((v5 & 2) == 0)
  {
LABEL_7:
    if ((v5 & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_23;
  }
LABEL_22:
  self->_assocDur = *((_DWORD *)v4 + 3);
  *(_WORD *)&self->_has |= 2u;
  __int16 v5 = *((_WORD *)v4 + 28);
  if ((v5 & 0x10) == 0)
  {
LABEL_8:
    if ((v5 & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_24;
  }
LABEL_23:
  self->_pnoBSSIDCount = *((_DWORD *)v4 + 6);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v5 = *((_WORD *)v4 + 28);
  if ((v5 & 0x20) == 0)
  {
LABEL_9:
    if ((v5 & 0x40) == 0) {
      goto LABEL_10;
    }
    goto LABEL_25;
  }
LABEL_24:
  self->_pnoBSSIDDur = *((_DWORD *)v4 + 7);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v5 = *((_WORD *)v4 + 28);
  if ((v5 & 0x40) == 0)
  {
LABEL_10:
    if ((v5 & 0x80) == 0) {
      goto LABEL_11;
    }
    goto LABEL_26;
  }
LABEL_25:
  self->_pnoSSIDCount = *((_DWORD *)v4 + 8);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v5 = *((_WORD *)v4 + 28);
  if ((v5 & 0x80) == 0)
  {
LABEL_11:
    if ((v5 & 4) == 0) {
      goto LABEL_12;
    }
    goto LABEL_27;
  }
LABEL_26:
  self->_pnoSSIDDur = *((_DWORD *)v4 + 9);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v5 = *((_WORD *)v4 + 28);
  if ((v5 & 4) == 0)
  {
LABEL_12:
    if ((v5 & 8) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_27:
  self->_otherCount = *((_DWORD *)v4 + 4);
  *(_WORD *)&self->_has |= 4u;
  if ((*((_WORD *)v4 + 28) & 8) != 0)
  {
LABEL_13:
    self->_otherDur = *((_DWORD *)v4 + 5);
    *(_WORD *)&self->_has |= 8u;
  }
LABEL_14:
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