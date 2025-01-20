@interface KCellularCellPlmnSearchCount
- (BOOL)hasCdma1xSearchCount;
- (BOOL)hasCdmaEvdoSearchCount;
- (BOOL)hasDurationMs;
- (BOOL)hasGsmSearchCount;
- (BOOL)hasLteSearchCount;
- (BOOL)hasSubsId;
- (BOOL)hasTdscdmaSearchCount;
- (BOOL)hasTimestamp;
- (BOOL)hasUmtsSearchCount;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)cdma1xSearchCount;
- (unsigned)cdmaEvdoSearchCount;
- (unsigned)durationMs;
- (unsigned)gsmSearchCount;
- (unsigned)lteSearchCount;
- (unsigned)subsId;
- (unsigned)tdscdmaSearchCount;
- (unsigned)umtsSearchCount;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCdma1xSearchCount:(unsigned int)a3;
- (void)setCdmaEvdoSearchCount:(unsigned int)a3;
- (void)setDurationMs:(unsigned int)a3;
- (void)setGsmSearchCount:(unsigned int)a3;
- (void)setHasCdma1xSearchCount:(BOOL)a3;
- (void)setHasCdmaEvdoSearchCount:(BOOL)a3;
- (void)setHasDurationMs:(BOOL)a3;
- (void)setHasGsmSearchCount:(BOOL)a3;
- (void)setHasLteSearchCount:(BOOL)a3;
- (void)setHasSubsId:(BOOL)a3;
- (void)setHasTdscdmaSearchCount:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasUmtsSearchCount:(BOOL)a3;
- (void)setLteSearchCount:(unsigned int)a3;
- (void)setSubsId:(unsigned int)a3;
- (void)setTdscdmaSearchCount:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setUmtsSearchCount:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation KCellularCellPlmnSearchCount

- (void)setTimestamp:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setDurationMs:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_durationMs = a3;
}

- (void)setHasDurationMs:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasDurationMs
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setGsmSearchCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_gsmSearchCount = a3;
}

- (void)setHasGsmSearchCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasGsmSearchCount
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setUmtsSearchCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_umtsSearchCount = a3;
}

- (void)setHasUmtsSearchCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasUmtsSearchCount
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setTdscdmaSearchCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_tdscdmaSearchCount = a3;
}

- (void)setHasTdscdmaSearchCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasTdscdmaSearchCount
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setLteSearchCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_lteSearchCount = a3;
}

- (void)setHasLteSearchCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasLteSearchCount
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setCdma1xSearchCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_cdma1xSearchCount = a3;
}

- (void)setHasCdma1xSearchCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasCdma1xSearchCount
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setCdmaEvdoSearchCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_cdmaEvdoSearchCount = a3;
}

- (void)setHasCdmaEvdoSearchCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasCdmaEvdoSearchCount
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setSubsId:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasSubsId
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (id)description
{
  __int16 v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)KCellularCellPlmnSearchCount;
  v4 = [(KCellularCellPlmnSearchCount *)&v8 description];
  v5 = [(KCellularCellPlmnSearchCount *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  __int16 v3 = [MEMORY[0x1E4F1CA60] dictionary];
  __int16 has = (__int16)self->_has;
  if (has)
  {
    v7 = [NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v7 forKey:@"timestamp"];

    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  objc_super v8 = [NSNumber numberWithUnsignedInt:self->_durationMs];
  [v3 setObject:v8 forKey:@"duration_ms"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x100) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  v9 = [NSNumber numberWithUnsignedInt:self->_gsmSearchCount];
  [v3 setObject:v9 forKey:@"gsm_search_count"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  v10 = [NSNumber numberWithUnsignedInt:self->_umtsSearchCount];
  [v3 setObject:v10 forKey:@"umts_search_count"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  v11 = [NSNumber numberWithUnsignedInt:self->_tdscdmaSearchCount];
  [v3 setObject:v11 forKey:@"tdscdma_search_count"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  v12 = [NSNumber numberWithUnsignedInt:self->_lteSearchCount];
  [v3 setObject:v12 forKey:@"lte_search_count"];

  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  v13 = [NSNumber numberWithUnsignedInt:self->_cdma1xSearchCount];
  [v3 setObject:v13 forKey:@"cdma_1x_search_count"];

  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_9:
    if ((has & 0x40) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_21:
  v14 = [NSNumber numberWithUnsignedInt:self->_cdmaEvdoSearchCount];
  [v3 setObject:v14 forKey:@"cdma_evdo_search_count"];

  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_10:
    v5 = [NSNumber numberWithUnsignedInt:self->_subsId];
    [v3 setObject:v5 forKey:@"subs_id"];
  }
LABEL_11:
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return KCellularCellPlmnSearchCountReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x100) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
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
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_9:
    if ((has & 0x40) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_21:
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 0x40) != 0) {
LABEL_10:
  }
    PBDataWriterWriteUint32Field();
LABEL_11:
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    v4[1] = self->_timestamp;
    *((_WORD *)v4 + 24) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 6) = self->_durationMs;
  *((_WORD *)v4 + 24) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x100) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)v4 + 7) = self->_gsmSearchCount;
  *((_WORD *)v4 + 24) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)v4 + 11) = self->_umtsSearchCount;
  *((_WORD *)v4 + 24) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)v4 + 10) = self->_tdscdmaSearchCount;
  *((_WORD *)v4 + 24) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)v4 + 8) = self->_lteSearchCount;
  *((_WORD *)v4 + 24) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)v4 + 4) = self->_cdma1xSearchCount;
  *((_WORD *)v4 + 24) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_9:
    if ((has & 0x40) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_21:
  *((_DWORD *)v4 + 5) = self->_cdmaEvdoSearchCount;
  *((_WORD *)v4 + 24) |= 4u;
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_10:
    *((_DWORD *)v4 + 9) = self->_subsId;
    *((_WORD *)v4 + 24) |= 0x40u;
  }
LABEL_11:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  __int16 has = (__int16)self->_has;
  if (has)
  {
    *((void *)result + 1) = self->_timestamp;
    *((_WORD *)result + 24) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 6) = self->_durationMs;
  *((_WORD *)result + 24) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x100) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)result + 7) = self->_gsmSearchCount;
  *((_WORD *)result + 24) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)result + 11) = self->_umtsSearchCount;
  *((_WORD *)result + 24) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)result + 10) = self->_tdscdmaSearchCount;
  *((_WORD *)result + 24) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)result + 8) = self->_lteSearchCount;
  *((_WORD *)result + 24) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)result + 4) = self->_cdma1xSearchCount;
  *((_WORD *)result + 24) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_9:
    if ((has & 0x40) == 0) {
      return result;
    }
    goto LABEL_10;
  }
LABEL_19:
  *((_DWORD *)result + 5) = self->_cdmaEvdoSearchCount;
  *((_WORD *)result + 24) |= 4u;
  if ((*(_WORD *)&self->_has & 0x40) == 0) {
    return result;
  }
LABEL_10:
  *((_DWORD *)result + 9) = self->_subsId;
  *((_WORD *)result + 24) |= 0x40u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_47;
  }
  __int16 has = (__int16)self->_has;
  __int16 v6 = *((_WORD *)v4 + 24);
  if (has)
  {
    if ((v6 & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_47;
    }
  }
  else if (v6)
  {
LABEL_47:
    BOOL v7 = 0;
    goto LABEL_48;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_durationMs != *((_DWORD *)v4 + 6)) {
      goto LABEL_47;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_47;
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_gsmSearchCount != *((_DWORD *)v4 + 7)) {
      goto LABEL_47;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_47;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 24) & 0x100) == 0 || self->_umtsSearchCount != *((_DWORD *)v4 + 11)) {
      goto LABEL_47;
    }
  }
  else if ((*((_WORD *)v4 + 24) & 0x100) != 0)
  {
    goto LABEL_47;
  }
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_tdscdmaSearchCount != *((_DWORD *)v4 + 10)) {
      goto LABEL_47;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_47;
  }
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_lteSearchCount != *((_DWORD *)v4 + 8)) {
      goto LABEL_47;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_47;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_cdma1xSearchCount != *((_DWORD *)v4 + 4)) {
      goto LABEL_47;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_47;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_cdmaEvdoSearchCount != *((_DWORD *)v4 + 5)) {
      goto LABEL_47;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_47;
  }
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_subsId != *((_DWORD *)v4 + 9)) {
      goto LABEL_47;
    }
    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = (v6 & 0x40) == 0;
  }
LABEL_48:

  return v7;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if (has)
  {
    unint64_t v3 = 2654435761u * self->_timestamp;
    if ((has & 8) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_durationMs;
      if ((has & 0x10) != 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else
  {
    unint64_t v3 = 0;
    if ((has & 8) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_gsmSearchCount;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v5 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_umtsSearchCount;
    if ((has & 0x80) != 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v6 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_6:
    uint64_t v7 = 2654435761 * self->_tdscdmaSearchCount;
    if ((has & 0x20) != 0) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v7 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_7:
    uint64_t v8 = 2654435761 * self->_lteSearchCount;
    if ((has & 2) != 0) {
      goto LABEL_8;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v8 = 0;
  if ((has & 2) != 0)
  {
LABEL_8:
    uint64_t v9 = 2654435761 * self->_cdma1xSearchCount;
    if ((has & 4) != 0) {
      goto LABEL_9;
    }
LABEL_18:
    uint64_t v10 = 0;
    if ((has & 0x40) != 0) {
      goto LABEL_10;
    }
LABEL_19:
    uint64_t v11 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
  }
LABEL_17:
  uint64_t v9 = 0;
  if ((has & 4) == 0) {
    goto LABEL_18;
  }
LABEL_9:
  uint64_t v10 = 2654435761 * self->_cdmaEvdoSearchCount;
  if ((has & 0x40) == 0) {
    goto LABEL_19;
  }
LABEL_10:
  uint64_t v11 = 2654435761 * self->_subsId;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  __int16 v5 = *((_WORD *)v4 + 24);
  if (v5)
  {
    self->_timestamp = *((void *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
    __int16 v5 = *((_WORD *)v4 + 24);
    if ((v5 & 8) == 0)
    {
LABEL_3:
      if ((v5 & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((v5 & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_durationMs = *((_DWORD *)v4 + 6);
  *(_WORD *)&self->_has |= 8u;
  __int16 v5 = *((_WORD *)v4 + 24);
  if ((v5 & 0x10) == 0)
  {
LABEL_4:
    if ((v5 & 0x100) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  self->_gsmSearchCount = *((_DWORD *)v4 + 7);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v5 = *((_WORD *)v4 + 24);
  if ((v5 & 0x100) == 0)
  {
LABEL_5:
    if ((v5 & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  self->_umtsSearchCount = *((_DWORD *)v4 + 11);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v5 = *((_WORD *)v4 + 24);
  if ((v5 & 0x80) == 0)
  {
LABEL_6:
    if ((v5 & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  self->_tdscdmaSearchCount = *((_DWORD *)v4 + 10);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v5 = *((_WORD *)v4 + 24);
  if ((v5 & 0x20) == 0)
  {
LABEL_7:
    if ((v5 & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  self->_lteSearchCount = *((_DWORD *)v4 + 8);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v5 = *((_WORD *)v4 + 24);
  if ((v5 & 2) == 0)
  {
LABEL_8:
    if ((v5 & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  self->_cdma1xSearchCount = *((_DWORD *)v4 + 4);
  *(_WORD *)&self->_has |= 2u;
  __int16 v5 = *((_WORD *)v4 + 24);
  if ((v5 & 4) == 0)
  {
LABEL_9:
    if ((v5 & 0x40) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_21:
  self->_cdmaEvdoSearchCount = *((_DWORD *)v4 + 5);
  *(_WORD *)&self->_has |= 4u;
  if ((*((_WORD *)v4 + 24) & 0x40) != 0)
  {
LABEL_10:
    self->_subsId = *((_DWORD *)v4 + 9);
    *(_WORD *)&self->_has |= 0x40u;
  }
LABEL_11:
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)durationMs
{
  return self->_durationMs;
}

- (unsigned)gsmSearchCount
{
  return self->_gsmSearchCount;
}

- (unsigned)umtsSearchCount
{
  return self->_umtsSearchCount;
}

- (unsigned)tdscdmaSearchCount
{
  return self->_tdscdmaSearchCount;
}

- (unsigned)lteSearchCount
{
  return self->_lteSearchCount;
}

- (unsigned)cdma1xSearchCount
{
  return self->_cdma1xSearchCount;
}

- (unsigned)cdmaEvdoSearchCount
{
  return self->_cdmaEvdoSearchCount;
}

- (unsigned)subsId
{
  return self->_subsId;
}

@end